import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/car_analysis.dart';

export 'mock_vision_api.dart';

abstract class VisionApi {
  Future<CarAnalysis> analyze({
    required XFile image,
    String? hint,
  });
}

class OpenAIVisionApi implements VisionApi {
  final Dio _dio;
  final String baseUrl;

  OpenAIVisionApi({
    required this.baseUrl,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.headers = {
      'Content-Type': 'multipart/form-data',
    };
  }

  @override
  Future<CarAnalysis> analyze({
    required XFile image,
    String? hint,
  }) async {
    try {
      final imageFile = File(image.path);
      final imageBytes = await imageFile.readAsBytes();

      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(
          imageBytes,
          filename: 'car_image.jpg',
        ),
        if (hint != null && hint.isNotEmpty) 'hint': hint,
      });

      final response = await _dio.post(
        '$baseUrl/analyze-image',
        data: formData,
      );

      if (response.statusCode == 200) {
        final analysisData = response.data as Map<String, dynamic>;

        // Add required fields that might be missing
        analysisData['imageLocalPath'] = image.path;
        analysisData['id'] = analysisData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();
        analysisData['createdAt'] = analysisData['createdAt'] ?? DateTime.now().toIso8601String();
        analysisData['disclaimer'] = analysisData['disclaimer'] ?? 'Analysis based on visual identification. Verify specific details.';

        // Ensure all required string fields are not null
        analysisData['make'] = analysisData['make'] ?? 'Unknown Make';
        analysisData['model'] = analysisData['model'] ?? 'Unknown Model';
        analysisData['generation'] = analysisData['generation']; // Can be null
        analysisData['year_range'] = analysisData['year_range'] ?? 'Unknown Year';
        analysisData['body_style'] = analysisData['body_style'] ?? 'Unknown Style';
        analysisData['confidence'] = analysisData['confidence'] ?? 0.5;

        // Safely handle array fields with null checking
        final trimCandidates = analysisData['trim_candidates'];
        analysisData['trim_candidates'] = (trimCandidates is List) ? trimCandidates : [];

        final notableHistory = analysisData['notable_history'];
        analysisData['notable_history'] = (notableHistory is List) ? notableHistory : [];

        final maintenanceTips = analysisData['maintenance_tips'];
        analysisData['maintenance_tips'] = (maintenanceTips is List) ? maintenanceTips : [];

        final similarModels = analysisData['similar_models'];
        analysisData['similar_models'] = (similarModels is List) ? similarModels : [];

        // Fix the key naming differences between snake_case and camelCase
        analysisData['yearRange'] = analysisData['year_range'];
        analysisData['bodyStyle'] = analysisData['body_style'];

        // Use the already safe arrays
        analysisData['trimCandidates'] = analysisData['trim_candidates'];
        analysisData['notableHistory'] = analysisData['notable_history'];
        analysisData['maintenanceTips'] = analysisData['maintenance_tips'];
        analysisData['similarModels'] = analysisData['similar_models'];

        if (analysisData['key_specs'] != null) {
          final keySpecs = analysisData['key_specs'] as Map<String, dynamic>;

          // Ensure all key_specs arrays are properly typed
          final engineOptions = keySpecs['engine_options'];
          final drivetrain = keySpecs['drivetrain'];
          final transmission = keySpecs['transmission'];

          // Convert to camelCase for Flutter model
          analysisData['keySpecs'] = {
            'engineOptions': (engineOptions is List) ? engineOptions : [],
            'drivetrain': (drivetrain is List) ? drivetrain : [],
            'transmission': (transmission is List) ? transmission : [],
          };
        } else {
          // Provide default keySpecs if missing
          analysisData['keySpecs'] = {
            'engineOptions': [],
            'drivetrain': [],
            'transmission': [],
          };
        }

        // Handle performance_specs conversion
        if (analysisData['performance_specs'] != null && analysisData['performance_specs'] is Map) {
          final performanceSpecs = analysisData['performance_specs'] as Map<String, dynamic>;

          // Keep snake_case for fields that have @JsonKey annotations
          analysisData['performanceSpecs'] = {
            'horsepower': performanceSpecs['horsepower'] ?? 'Data unavailable',
            'torque': performanceSpecs['torque'] ?? 'Data unavailable',
            'zero_to_sixty': performanceSpecs['zero_to_sixty'] ?? 'Data unavailable',
            'top_speed': performanceSpecs['top_speed'] ?? 'Data unavailable',
            'fuel_economy': performanceSpecs['fuel_economy'] ?? 'Data unavailable',
          };
        } else {
          // Provide default performanceSpecs if missing (use snake_case)
          analysisData['performanceSpecs'] = {
            'horsepower': 'Data unavailable',
            'torque': 'Data unavailable',
            'zero_to_sixty': 'Data unavailable',
            'top_speed': 'Data unavailable',
            'fuel_economy': 'Data unavailable',
          };
        }

        // Handle price_estimates conversion
        if (analysisData['price_estimates'] != null) {
          final priceEstimates = analysisData['price_estimates'] as Map<String, dynamic>;

          // Convert snake_case to camelCase for Flutter model
          analysisData['priceEstimates'] = {
            'newMsrp': priceEstimates['new_msrp'] ?? 'Price data unavailable',
            'usedFair': priceEstimates['used_fair'] ?? 'Price data unavailable',
            'usedGood': priceEstimates['used_good'] ?? 'Price data unavailable',
            'usedExcellent': priceEstimates['used_excellent'] ?? 'Price data unavailable',
            'marketInsights': priceEstimates['market_insights'] ?? 'Contact local dealers for current market pricing',
          };
        } else {
          // Provide default priceEstimates if missing
          analysisData['priceEstimates'] = {
            'newMsrp': 'Price data unavailable',
            'usedFair': 'Price data unavailable',
            'usedGood': 'Price data unavailable',
            'usedExcellent': 'Price data unavailable',
            'marketInsights': 'Contact local dealers for current market pricing',
          };
        }

        print('DEBUG: About to parse CarAnalysis with data: ${analysisData.keys}');

        try {
          return CarAnalysis.fromJson(analysisData);
        } catch (e, stackTrace) {
          print('ERROR: Failed to parse CarAnalysis: $e');
          print('Stack trace: $stackTrace');
          print('Analysis data: $analysisData');
          throw VisionApiException('Failed to parse analysis result: $e');
        }
      } else {
        throw VisionApiException('Analysis failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw VisionApiException('Connection timeout. Please check your internet connection.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw VisionApiException('Request timeout. The server took too long to respond.');
      } else if (e.response?.statusCode == 413) {
        throw VisionApiException('Image too large. Please try a smaller image.');
      } else if (e.response?.statusCode == 429) {
        throw VisionApiException('Too many requests. Please try again later.');
      } else {
        throw VisionApiException('Network error: ${e.message}');
      }
    } catch (e) {
      throw VisionApiException('Unexpected error: $e');
    }
  }
}

class VisionApiException implements Exception {
  final String message;

  const VisionApiException(this.message);

  @override
  String toString() => 'VisionApiException: $message';
}