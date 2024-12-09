import 'package:flutter/material.dart';
import 'package:weather/mosels/weather_forecast_daily.dart';

///Виджет города
class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forrecastList = snapshot.data;
    var city = forrecastList?.location?.name ?? '';
    var country = forrecastList?.location?.country ?? '';
    var formatedDate = forrecastList?.location?.localtime ?? "";

    return Column(
      children: [
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
        Text(
          formatedDate,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
