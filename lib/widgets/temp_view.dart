import 'package:flutter/material.dart';
import 'package:weather/mosels/weather_forecast_daily.dart';

/// виджет температуры

class Tempview extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const Tempview({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forrecastList = snapshot.data;
    var icon = forrecastList?.current?.condition?.icon;
    var temp = forrecastList?.current?.tempC;
    var description = forrecastList?.current?.condition?.text.toString() ?? "";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https:$icon",
          scale: 0.4,
          // color: Colors.black87,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 54.0, color: Colors.black87),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            )
          ],
        )
      ],
    );
  }
}
