import 'dart:math';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/car_analysis.dart';
import '../../domain/entities/trim_candidate.dart';
import '../../domain/entities/key_specs.dart';
import '../../domain/entities/price_estimates.dart';
import '../../domain/entities/similar_model.dart';
import 'vision_api.dart';

class MockVisionApi implements VisionApi {
  final Random _random = Random();

  @override
  Future<CarAnalysis> analyze({
    required XFile image,
    String? hint,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2 + _random.nextInt(3)));

    final mockAnalyses = [
      _createMockToyotaCamry(image.path),
      _createMockBMW3Series(image.path),
      _createMockHondaCivic(image.path),
      _createMockFordMustang(image.path),
    ];

    return mockAnalyses[_random.nextInt(mockAnalyses.length)];
  }

  CarAnalysis _createMockToyotaCamry(String imagePath) {
    return CarAnalysis(
      make: 'Toyota',
      model: 'Camry',
      generation: '8th Generation (XV70)',
      yearRange: '2018-2023',
      bodyStyle: 'Midsize Sedan',
      trimCandidates: [
        const TrimCandidate(name: 'XLE', confidence: 0.85),
        const TrimCandidate(name: 'SE', confidence: 0.72),
        const TrimCandidate(name: 'XSE', confidence: 0.68),
      ],
      confidence: 0.87,
      keySpecs: const KeySpecs(
        engineOptions: ['2.5L 4-cylinder', '3.5L V6'],
        drivetrain: ['FWD'],
        transmission: ['8-speed automatic'],
      ),
      priceEstimates: const PriceEstimates(
        newMsrp: r'$26,000 - $36,000',
        usedFair: r'$18,000 - $28,000',
        usedGood: r'$20,000 - $31,000',
        usedExcellent: r'$23,000 - $34,000',
        marketInsights: 'Strong resale value. Popular in used market with good availability.',
      ),
      notableHistory: [
        'Best-selling sedan in America for decades',
        'Known for exceptional reliability and resale value',
        'Major redesign in 2018 with sportier styling',
      ],
      maintenanceTips: [
        'Change oil every 10,000 miles or 12 months',
        'Replace air filter every 30,000 miles',
        'Check brake pads around 60,000 miles',
        'Toyota Care includes 2 years of free maintenance',
      ],
      similarModels: [
        const SimilarModel(name: 'Honda Accord', why: 'Direct competitor in midsize sedan segment'),
        const SimilarModel(name: 'Nissan Altima', why: 'Similar size and market positioning'),
        const SimilarModel(name: 'Hyundai Sonata', why: 'Comparable features and pricing'),
      ],
      disclaimer: 'Analysis based on visual identification. Verify specific trim and year details.',
      imageLocalPath: imagePath,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
    );
  }

  CarAnalysis _createMockBMW3Series(String imagePath) {
    return CarAnalysis(
      make: 'BMW',
      model: '3 Series',
      generation: '7th Generation (G20)',
      yearRange: '2019-2023',
      bodyStyle: 'Compact Executive Sedan',
      trimCandidates: [
        const TrimCandidate(name: '330i', confidence: 0.78),
        const TrimCandidate(name: '340i', confidence: 0.65),
        const TrimCandidate(name: 'M340i', confidence: 0.45),
      ],
      confidence: 0.82,
      keySpecs: const KeySpecs(
        engineOptions: ['2.0L turbo 4-cylinder', '3.0L turbo 6-cylinder'],
        drivetrain: ['RWD', 'AWD (xDrive)'],
        transmission: ['8-speed automatic'],
      ),
      priceEstimates: const PriceEstimates(
        newMsrp: r'$42,000 - $57,000',
        usedFair: r'$28,000 - $42,000',
        usedGood: r'$32,000 - $47,000',
        usedExcellent: r'$37,000 - $52,000',
        marketInsights: 'Premium sport sedan. Higher maintenance costs than non-luxury brands.',
      ),
      notableHistory: [
        'BMW\'s entry-level luxury sedan since 1975',
        'Benchmark for sport sedan dynamics',
        'Current generation launched in 2019',
      ],
      maintenanceTips: [
        'Use BMW-approved synthetic oil only',
        'Service every 10,000 miles',
        'Monitor for oil leaks around valve cover',
        'Replace brake fluid every 3 years',
      ],
      similarModels: [
        const SimilarModel(name: 'Mercedes C-Class', why: 'Direct luxury compact sedan rival'),
        const SimilarModel(name: 'Audi A4', why: 'German luxury competitor'),
        const SimilarModel(name: 'Genesis G70', why: 'Sports-oriented luxury alternative'),
      ],
      disclaimer: 'Analysis based on visual identification. Verify specific trim and year details.',
      imageLocalPath: imagePath,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
    );
  }

  CarAnalysis _createMockHondaCivic(String imagePath) {
    return CarAnalysis(
      make: 'Honda',
      model: 'Civic',
      generation: '11th Generation',
      yearRange: '2022-2024',
      bodyStyle: 'Compact Sedan',
      trimCandidates: [
        const TrimCandidate(name: 'Sport', confidence: 0.75),
        const TrimCandidate(name: 'EX', confidence: 0.68),
        const TrimCandidate(name: 'Touring', confidence: 0.55),
      ],
      confidence: 0.89,
      keySpecs: const KeySpecs(
        engineOptions: ['2.0L 4-cylinder', '1.5L turbo 4-cylinder'],
        drivetrain: ['FWD'],
        transmission: ['CVT', '6-speed manual'],
      ),
      priceEstimates: const PriceEstimates(
        newMsrp: r'$24,000 - $31,000',
        usedFair: r'$20,000 - $26,000',
        usedGood: r'$22,000 - $28,000',
        usedExcellent: r'$24,000 - $30,000',
        marketInsights: 'High demand compact car with excellent resale value. Fuel efficiency is a key selling point.',
      ),
      notableHistory: [
        'America\'s favorite compact car for generations',
        'Known for reliability and fuel efficiency',
        'Completely redesigned for 2022 model year',
      ],
      maintenanceTips: [
        'Change oil every 7,500 miles',
        'CVT fluid change at 100,000 miles',
        'Replace air filter every 30,000 miles',
        'Very low maintenance requirements',
      ],
      similarModels: [
        const SimilarModel(name: 'Toyota Corolla', why: 'Top compact sedan competitor'),
        const SimilarModel(name: 'Nissan Sentra', why: 'Similar size and efficiency focus'),
        const SimilarModel(name: 'Hyundai Elantra', why: 'Comparable features and warranty'),
      ],
      disclaimer: 'Analysis based on visual identification. Verify specific trim and year details.',
      imageLocalPath: imagePath,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
    );
  }

  CarAnalysis _createMockFordMustang(String imagePath) {
    return CarAnalysis(
      make: 'Ford',
      model: 'Mustang',
      generation: '6th Generation (S550)',
      yearRange: '2015-2023',
      bodyStyle: 'Pony Car / Muscle Car',
      trimCandidates: [
        const TrimCandidate(name: 'GT', confidence: 0.82),
        const TrimCandidate(name: 'EcoBoost', confidence: 0.71),
        const TrimCandidate(name: 'GT350', confidence: 0.35),
      ],
      confidence: 0.91,
      keySpecs: const KeySpecs(
        engineOptions: ['2.3L turbo 4-cylinder', '5.0L V8'],
        drivetrain: ['RWD'],
        transmission: ['6-speed manual', '10-speed automatic'],
      ),
      priceEstimates: const PriceEstimates(
        newMsrp: r'$28,000 - $75,000',
        usedFair: r'$18,000 - $45,000',
        usedGood: r'$22,000 - $55,000',
        usedExcellent: r'$26,000 - $65,000',
        marketInsights: 'Wide price range depending on engine and trim. V8 models hold value better. Performance models command premium prices.',
      ),
      notableHistory: [
        'America\'s original pony car since 1964',
        'Icon of American automotive culture',
        'Current generation launched in 2015',
        'Available with both turbo-4 and V8 options',
      ],
      maintenanceTips: [
        'Use premium fuel for best performance',
        'Change oil every 7,500 miles',
        'Monitor rear tire wear on performance models',
        'Regular brake inspections for track use',
      ],
      similarModels: [
        const SimilarModel(name: 'Chevrolet Camaro', why: 'Historic pony car rival'),
        const SimilarModel(name: 'Dodge Challenger', why: 'American muscle car competitor'),
        const SimilarModel(name: 'Toyota Supra', why: 'Modern sports car alternative'),
      ],
      disclaimer: 'Analysis based on visual identification. Verify specific trim and year details.',
      imageLocalPath: imagePath,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
    );
  }
}