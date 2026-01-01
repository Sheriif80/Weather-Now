import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/get_theme_color.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;
    int minTemp = weatherModel.minTemp.round();
    int maxTemp = weatherModel.maxTemp.round();
    int temp = weatherModel.temp.round();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.condition),
            getThemeColor(weatherModel.condition)[200]!,
            getThemeColor(weatherModel.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.city,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  '$temp C',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'MAX temp: $maxTemp C',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MIN temp: $minTemp C',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              weatherModel.condition.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
