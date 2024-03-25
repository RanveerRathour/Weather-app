part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => <Object>[];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailed extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  const WeatherSuccess({required this.temperature});
  final Temperatures temperature;
  @override
  List<Object> get props => <Object>[temperature];
}
