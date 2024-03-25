part of 'fetch_selected_weather_cubit.dart';

sealed class FetchSelectedWeatherState extends Equatable {
  const FetchSelectedWeatherState();

  @override
  List<Object> get props => <Object>[];
}

final class FetchSelectedWeatherInitialState
    extends FetchSelectedWeatherState {}

final class FetchSelectedWeatherLoadingState
    extends FetchSelectedWeatherState {}

final class FetchSelectedWeatherFailedState extends FetchSelectedWeatherState {}

final class FetchSelectedWeatherSuccessState
    extends FetchSelectedWeatherState {}
