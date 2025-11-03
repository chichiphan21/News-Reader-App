import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsApiService {
  // Replace with your API key from https://newsapi.org/
  static const String _apiKey = '2f403d90292c4571836c3fb1313d0db9';
  static const String _baseUrl = 'https://newsapi.org/v2';

  /// Fetches top headlines from NewsAPI
  ///
  /// [country] - 2-letter ISO 3166-1 code of the country (default: 'us')
  /// [category] - Category of news (business, entertainment, general, health, science, sports, technology)
  /// [pageSize] - Number of results to return (default: 20, max: 100)
  Future<NewsResponse> getTopHeadlines({
    String country = 'us',
    String? category,
    int pageSize = 20,
  }) async {
    try {
      final queryParameters = {
        'country': country,
        'apiKey': _apiKey,
        'pageSize': pageSize.toString(),
        if (category != null) 'category': category,
      };

      final uri = Uri.parse('$_baseUrl/top-headlines')
          .replace(queryParameters: queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return NewsResponse.fromJson(jsonData);
      } else if (response.statusCode == 401) {
        throw Exception('Invalid API key. Please check your NewsAPI key.');
      } else if (response.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      } else {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final message = jsonData['message'] ?? 'Failed to load news';
        throw Exception(message);
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception(
          'Network error: Unable to fetch news. Please check your internet connection.');
    }
  }

  /// Searches for news articles
  ///
  /// [query] - Keywords or phrases to search for
  /// [sortBy] - The order to sort the articles (relevancy, popularity, publishedAt)
  /// [pageSize] - Number of results to return (default: 20, max: 100)
  Future<NewsResponse> searchNews({
    required String query,
    String sortBy = 'publishedAt',
    int pageSize = 20,
  }) async {
    try {
      final queryParameters = {
        'q': query,
        'apiKey': _apiKey,
        'sortBy': sortBy,
        'pageSize': pageSize.toString(),
      };

      final uri = Uri.parse('$_baseUrl/everything')
          .replace(queryParameters: queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return NewsResponse.fromJson(jsonData);
      } else if (response.statusCode == 401) {
        throw Exception('Invalid API key. Please check your NewsAPI key.');
      } else if (response.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      } else {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final message = jsonData['message'] ?? 'Failed to search news';
        throw Exception(message);
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception(
          'Network error: Unable to search news. Please check your internet connection.');
    }
  }
}
