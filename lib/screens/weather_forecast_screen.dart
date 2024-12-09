import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/mosels/weather_forecast_daily.dart';
import 'package:weather/widgets/sity_view.dart';
import 'package:weather/widgets/temp_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///Экран с погодой

class WeaterForecastScreen extends StatefulWidget {
  const WeaterForecastScreen({super.key});

  @override
  State<WeaterForecastScreen> createState() => _WeaterForecastScreenState();
}

class _WeaterForecastScreenState extends State<WeaterForecastScreen> {
  late String cityName = 'Omsk';
  late Future<WeatherForecast> forcastObject =
      WeatherApi().getCurrentWeather(cityName);

  WeatherForecast? response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          _search(),
          _buildWeatherWidget(),
        ],
      ),
    );
  }

///ищем город
  Widget _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 270,
            child: TextField(
              cursorColor: Colors.blueGrey[800],
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter City Name',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
            onPressed: () {
              setState(() {
                forcastObject = WeatherApi().getCurrentWeather(cityName);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherWidget() {
    return FutureBuilder<WeatherForecast>(
      future: forcastObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50),
                CityView(snapshot: snapshot),
                Tempview(snapshot: snapshot),
              ],
            ),
          );
        } else {
          return const Center(
            child: SpinKitDoubleBounce(
              color: Colors.black87,
              size: 100.0,
            ),
          );
        }
      },
    );
  }
}
