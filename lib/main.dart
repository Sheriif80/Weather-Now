import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_state.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/widgets/get_theme_color.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (contextAfterCubit) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      contextAfterCubit,
                    ).weatherModel?.condition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
