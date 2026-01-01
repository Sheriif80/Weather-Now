import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  final c = condition?.toLowerCase() ?? '';

  // ☀️ Clear / Sunny
  if (c.contains('sunny') || c.contains('clear')) {
    return Colors.orange;
  }

  // 🌤️ Partly cloudy
  if (c.contains('partly cloudy')) {
    return Colors.amber;
  }

  // ☁️ Cloudy / Overcast
  if (c.contains('cloudy') || c.contains('overcast')) {
    return Colors.blueGrey;
  }

  // 🌫️ Fog / Mist / Haze
  if (c.contains('mist') ||
      c.contains('fog') ||
      c.contains('haze') ||
      c.contains('freezing fog')) {
    return Colors.grey;
  }

  // 🌦️ Light rain / Drizzle
  if (c.contains('drizzle') ||
      c.contains('light rain') ||
      c.contains('patchy rain')) {
    return Colors.lightBlue;
  }

  // 🌧️ Heavy rain
  if (c.contains('moderate rain') ||
      c.contains('heavy rain') ||
      c.contains('torrential')) {
    return Colors.blue;
  }

  // ⛈️ Thunder
  if (c.contains('thunder')) {
    return Colors.deepPurple;
  }

  // ❄️ Light snow
  if (c.contains('light snow') || c.contains('patchy snow')) {
    return Colors.cyan;
  }

  // 🌨️ Heavy snow / Blizzard
  if (c.contains('heavy snow') ||
      c.contains('blizzard') ||
      c.contains('blowing snow')) {
    return Colors.indigo;
  }

  // 🧊 Sleet / Ice
  if (c.contains('sleet') ||
      c.contains('ice pellets') ||
      c.contains('freezing rain') ||
      c.contains('freezing drizzle')) {
    return Colors.teal;
  }

  // 🌪️ Extreme / Dust / Sand
  if (c.contains('dust') || c.contains('sand') || c.contains('storm')) {
    return Colors.brown;
  }

  // 🌈 Fallback
  return Colors.green;
}
