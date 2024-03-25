part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeather extends WeatherEvent {}

class FetchWeatherBySearch extends WeatherEvent {}
