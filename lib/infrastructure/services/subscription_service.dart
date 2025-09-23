import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubscriptionService {
  static const String _monthlyProductId = 'com.carpeek.app.monthly';  // Product ID format: bundleID.productName
  static const String _yearlyProductId = 'com.carpeek.app.yearly';  // TODO: Configure in App Store Connect
  static const String _subscriptionBoxName = 'subscription_data';
  static const String _scanTrackingBoxName = 'scan_tracking';
  static const int _freeScansBeforePaywall = 1;

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late Box _subscriptionBox;
  late Box _scanBox;

  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final _subscriptionStatusController = StreamController<SubscriptionStatus>.broadcast();

  Stream<SubscriptionStatus> get subscriptionStatus => _subscriptionStatusController.stream;

  // Product details
  List<ProductDetails> _products = [];

  SubscriptionService._();
  static final SubscriptionService instance = SubscriptionService._();

  Future<void> initialize() async {
    debugPrint('🚀 Initializing SubscriptionService...');

    // Initialize Hive boxes
    _subscriptionBox = await Hive.openBox(_subscriptionBoxName);
    _scanBox = await Hive.openBox(_scanTrackingBoxName);

    // Check if in-app purchases are available
    final bool available = await _inAppPurchase.isAvailable();
    if (!available) {
      debugPrint('❌ In-app purchases not available on this device');
      debugPrint('   Check that:');
      debugPrint('   1. Device is not jailbroken');
      debugPrint('   2. App Store is accessible');
      debugPrint('   3. Parental controls allow purchases');
      return;
    }

    debugPrint('✅ In-app purchases are available');

    // Load products
    await _loadProducts();

    // Listen to purchase updates
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen(
      (purchaseDetailsList) {
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        _subscription?.cancel();
      },
      onError: (error) {
        debugPrint('Purchase stream error: $error');
      },
    );

    // Check current subscription status
    await _checkSubscriptionStatus();
  }

  Future<void> _loadProducts() async {
    const Set<String> _kIds = <String>{_monthlyProductId, _yearlyProductId};
    debugPrint('🔍 Attempting to load products with IDs: $_kIds');

    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(_kIds);

    if (response.error != null) {
      debugPrint('❌ Error loading products: ${response.error}');
      debugPrint('Error details: ${response.error?.message}');
      debugPrint('Error code: ${response.error?.code}');
      return;
    }

    debugPrint('📦 Response received. Products found: ${response.productDetails.length}');
    debugPrint('Not found IDs: ${response.notFoundIDs}');

    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('⚠️ These product IDs were not found in App Store Connect:');
      for (final id in response.notFoundIDs) {
        debugPrint('  - $id');
      }
    }

    if (response.productDetails.isEmpty) {
      debugPrint('❌ No products found. Check that:');
      debugPrint('  1. Products are created in App Store Connect');
      debugPrint('  2. Products are in "Ready to Submit" or "Approved" state');
      debugPrint('  3. Bundle ID matches: com.carpeek.app');
      debugPrint('  4. Product IDs match exactly: $_kIds');
      return;
    }

    _products = response.productDetails;
    debugPrint('✅ Successfully loaded ${_products.length} products:');
    for (final product in _products) {
      debugPrint('  - ID: ${product.id}');
      debugPrint('    Title: ${product.title}');
      debugPrint('    Price: ${product.price}');
    }
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        debugPrint('Purchase pending...');
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          debugPrint('Purchase error: ${purchaseDetails.error}');
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                   purchaseDetails.status == PurchaseStatus.restored) {
          // Verify and deliver the purchase
          await _deliverPurchase(purchaseDetails);
        }

        // Mark purchase as complete
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    });
  }

  Future<void> _deliverPurchase(PurchaseDetails purchaseDetails) async {
    // Save subscription details
    await _subscriptionBox.put('isSubscribed', true);
    await _subscriptionBox.put('productId', purchaseDetails.productID);
    await _subscriptionBox.put('purchaseDate', DateTime.now().toIso8601String());

    // Calculate expiry date
    DateTime expiryDate;
    if (purchaseDetails.productID == _monthlyProductId) {
      expiryDate = DateTime.now().add(const Duration(days: 30));
    } else if (purchaseDetails.productID == _yearlyProductId) {
      expiryDate = DateTime.now().add(const Duration(days: 365));
    } else {
      expiryDate = DateTime.now().add(const Duration(days: 30));
    }

    await _subscriptionBox.put('expiryDate', expiryDate.toIso8601String());

    // Notify listeners
    _subscriptionStatusController.add(SubscriptionStatus.subscribed);

    debugPrint('Purchase delivered: ${purchaseDetails.productID}');
  }

  Future<void> _checkSubscriptionStatus() async {
    final bool isSubscribed = _subscriptionBox.get('isSubscribed', defaultValue: false);

    if (isSubscribed) {
      final String? expiryDateStr = _subscriptionBox.get('expiryDate');
      if (expiryDateStr != null) {
        final DateTime expiryDate = DateTime.parse(expiryDateStr);
        if (DateTime.now().isBefore(expiryDate)) {
          _subscriptionStatusController.add(SubscriptionStatus.subscribed);
          return;
        }
      }
    }

    _subscriptionStatusController.add(SubscriptionStatus.notSubscribed);
  }

  // Scan tracking methods
  Future<bool> canScan() async {
    // Check if user is subscribed
    final bool isSubscribed = await isUserSubscribed();
    if (isSubscribed) {
      return true;
    }

    // Check total scan count (lifetime)
    final int totalScans = await getTotalScans();
    return totalScans < _freeScansBeforePaywall;
  }

  Future<int> getTotalScans() async {
    return _scanBox.keys.length;
  }

  Future<int> getScansThisWeek() async {
    final DateTime now = DateTime.now();
    final DateTime weekStart = _getWeekStart(now);

    int scanCount = 0;
    final scans = _scanBox.keys;

    for (var key in scans) {
      final String? scanDateStr = _scanBox.get(key);
      if (scanDateStr != null) {
        final DateTime scanDate = DateTime.parse(scanDateStr);
        if (scanDate.isAfter(weekStart)) {
          scanCount++;
        }
      }
    }

    return scanCount;
  }

  Future<int> getRemainingFreeScans() async {
    final int totalScans = await getTotalScans();
    return (_freeScansBeforePaywall - totalScans).clamp(0, _freeScansBeforePaywall);
  }

  Future<void> recordScan() async {
    final String key = DateTime.now().millisecondsSinceEpoch.toString();
    await _scanBox.put(key, DateTime.now().toIso8601String());

    // Clean up old scans (older than 2 weeks)
    final DateTime twoWeeksAgo = DateTime.now().subtract(const Duration(days: 14));
    final List keysToRemove = [];

    for (var key in _scanBox.keys) {
      final String? scanDateStr = _scanBox.get(key);
      if (scanDateStr != null) {
        final DateTime scanDate = DateTime.parse(scanDateStr);
        if (scanDate.isBefore(twoWeeksAgo)) {
          keysToRemove.add(key);
        }
      }
    }

    for (var key in keysToRemove) {
      await _scanBox.delete(key);
    }
  }

  DateTime _getWeekStart(DateTime date) {
    // Get start of the week (Monday)
    final int daysFromMonday = date.weekday - 1;
    final DateTime monday = date.subtract(Duration(days: daysFromMonday));
    return DateTime(monday.year, monday.month, monday.day);
  }

  Future<bool> isUserSubscribed() async {
    final bool isSubscribed = _subscriptionBox.get('isSubscribed', defaultValue: false);

    if (!isSubscribed) {
      return false;
    }

    final String? expiryDateStr = _subscriptionBox.get('expiryDate');
    if (expiryDateStr == null) {
      return false;
    }

    final DateTime expiryDate = DateTime.parse(expiryDateStr);
    return DateTime.now().isBefore(expiryDate);
  }

  // Purchase methods
  Future<bool> purchaseMonthlySubscription() async {
    debugPrint('🛒 Starting monthly subscription purchase...');

    if (_products.isEmpty) {
      debugPrint('📦 No products loaded, attempting to load...');
      await _loadProducts();
    }

    if (_products.isEmpty) {
      debugPrint('❌ Still no products after loading attempt');
      debugPrint('   Make sure product ID "$_monthlyProductId" is configured in App Store Connect');
      return false;
    }

    debugPrint('🔍 Looking for monthly product with ID: $_monthlyProductId');
    debugPrint('   Available products: ${_products.map((p) => p.id).toList()}');

    ProductDetails? monthlyProduct;
    try {
      monthlyProduct = _products.firstWhere(
        (product) => product.id == _monthlyProductId,
      );
    } catch (e) {
      debugPrint('⚠️ Monthly product not found in loaded products');
      if (_products.isNotEmpty) {
        debugPrint('   Using first available product as fallback: ${_products.first.id}');
        monthlyProduct = _products.first;
      }
    }

    if (monthlyProduct == null) {
      debugPrint('❌ No monthly product available');
      return false;
    }

    debugPrint('✅ Found product: ${monthlyProduct.id} - ${monthlyProduct.title}');

    final PurchaseParam purchaseParam = PurchaseParam(productDetails: monthlyProduct);

    try {
      return await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      debugPrint('Purchase error: $e');
      return false;
    }
  }

  Future<bool> purchaseYearlySubscription() async {
    if (_products.isEmpty) {
      await _loadProducts();
    }

    final ProductDetails? yearlyProduct = _products.firstWhere(
      (product) => product.id == _yearlyProductId,
      orElse: () => _products.last,
    );

    if (yearlyProduct == null) {
      debugPrint('Yearly product not found');
      return false;
    }

    final PurchaseParam purchaseParam = PurchaseParam(productDetails: yearlyProduct);

    try {
      return await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      debugPrint('Purchase error: $e');
      return false;
    }
  }

  Future<void> restorePurchases() async {
    await _inAppPurchase.restorePurchases();
  }

  List<ProductDetails> getProducts() {
    return _products;
  }

  ProductDetails? getMonthlyProduct() {
    debugPrint('📱 Getting monthly product. Available products: ${_products.length}');
    if (_products.isEmpty) {
      debugPrint('⚠️ No products available');
      return null;
    }

    try {
      final product = _products.firstWhere((product) => product.id == _monthlyProductId);
      debugPrint('✅ Found monthly product: ${product.id}');
      return product;
    } catch (e) {
      debugPrint('⚠️ Monthly product not found, using first available');
      return _products.first;
    }
  }

  ProductDetails? getYearlyProduct() {
    if (_products.isEmpty) return null;
    return _products.firstWhere(
      (product) => product.id == _yearlyProductId,
      orElse: () => _products.last,
    );
  }

  void dispose() {
    _subscription?.cancel();
    _subscriptionStatusController.close();
  }
}

enum SubscriptionStatus {
  notSubscribed,
  subscribed,
  expired,
}