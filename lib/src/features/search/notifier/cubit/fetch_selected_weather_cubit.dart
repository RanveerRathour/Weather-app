import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../weather_home_page/models/location_model.dart';
import '../../../weather_home_page/models/temperatures_model.dart';
import '../../../weather_home_page/repositories/fetch_weather_repository.dart';

part 'fetch_selected_weather_state.dart';

class FetchSelectedWeatherCubit extends Cubit<FetchSelectedWeatherState> {
  FetchSelectedWeatherCubit() : super(FetchSelectedWeatherInitialState());

  Future<Temperatures?> fetchWeather({Location? location}) async {
    if (location != null) {
      emit(FetchSelectedWeatherLoadingState());
      final Temperatures? temp =
          await FetchWeatherRepository().fetchWeatherRepo(
        lat: location.lat.toString(),
        lon: location.lon.toString(),
      );
      if (temp != null) {
        emit(FetchSelectedWeatherSuccessState());
        return temp;
      }
    }
    emit(FetchSelectedWeatherFailedState());
    return null;
  }
}
