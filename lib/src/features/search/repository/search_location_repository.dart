import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../utilities/api_key.dart';
import '../../weather_home_page/models/location_model.dart';

class SearchLocationRepository {
  Future<List<Location>?> fetchWeatherRepo({
    required String name,
  }) async {
    const String key = ApiKey.weatherApiKey;
    final http.Client client = http.Client();
    try {
      final Map<String, String> queryParameters = <String, String>{
        'key': key,
        'q': name,
      };

      final http.Response response = await client.get(
        Uri(
          scheme: 'https',
          host: 'api.weatherapi.com',
          path: '/v1/search.json',
          queryParameters: queryParameters,
        ),
      );

      // Check if the response status code is successful (2xx)
      if (response.statusCode == 200) {
        // Parse the JSON response into location model
        final List<Location> cities =
            (jsonDecode(response.body) as List<dynamic>)
                .map<Location>((dynamic e) => Location.fromJson(e))
                .toList();

        // box.put('Temperature', temperatures);

        return cities;
      } else {
        // Handle non-successful response
        throw Exception('Failed to fetch weather: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      return null;
    } finally {
      // closing the client to prevent resource leaks
      client.close();
    }
  }
}
