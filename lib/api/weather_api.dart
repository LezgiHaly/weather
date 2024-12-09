import 'dart:convert';
import 'package:weather/mosels/weather_forecast_daily.dart';
import 'package:weather/utilities/constants.dart';
import 'package:http/http.dart' as http;

/// айпи
class WeatherApi {
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';
  Future<WeatherForecast> getCurrentWeather(String location) async {
    String apiUrl = '$baseUrl?key=$apiKey&q=$location';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return
            // print(response.body);
            WeatherForecast.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
