import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/get_theme_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final condition = context.read<GetWeatherCubit>().weatherModel?.condition;

    return Scaffold(
      appBar: AppBar(title: const Text("Search city")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: condition == null
                ? [Colors.white, Colors.white]
                : [getThemeColor(condition)[300]!, getThemeColor(condition)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (value) async {
                final GetWeatherCubit getWeatherCubit =
                    BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                label: const Text('Search'),
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.all(25),
                hint: const Text(
                  'Enter city name',
                  style: TextStyle(fontSize: 16),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
