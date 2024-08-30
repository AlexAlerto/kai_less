import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String cityName;
  final int temperature;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
      cityName: data['name'],
      temperature: data['main']['temp'].toInt(),
      icon: getWeatherIcon(data['weather'][0]['id']),
    );
  }

  @override
  List<Object?> get props => [cityName, temperature, icon];
  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
