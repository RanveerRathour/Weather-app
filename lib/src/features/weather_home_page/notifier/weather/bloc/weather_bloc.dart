import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';
import '../../../models/temperatures_model.dart';
import '../../../repositories/fetch_weather_repository.dart';
import '../../../repositories/fetch_location_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((FetchWeather event, Emitter<WeatherState> emit) async {
      emit(WeatherLoading());
      final Box<Temperatures> box = Hive.box('Temperature');
      final Temperatures? hiveTemp = box.get('Temperature');
      final LocationData? position =
          await FetchLocationRepository().getCurrentLocation();

      Temperatures? temp;

      if (position != null) {
        temp = await FetchWeatherRepository().fetchWeatherRepo(
          lat: position.latitude.toString(),
          lon: position.longitude.toString(),
        );
      }

      if (temp != null || hiveTemp != null) {
        emit(WeatherSuccess(temperature: temp ?? hiveTemp!));
        return;
      }

      emit(WeatherFailed());
      close();
    });
  }
}
