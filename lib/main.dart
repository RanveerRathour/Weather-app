import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'src/app.dart';
import 'src/features/settings/constant/settings_constant.dart';
import 'src/features/weather_home_page/models/astro_model.dart';
import 'src/features/weather_home_page/models/city_list_model.dart';
import 'src/features/weather_home_page/models/condition_model.dart';
import 'src/features/weather_home_page/models/current_model.dart';
import 'src/features/weather_home_page/models/day_model.dart';
import 'src/features/weather_home_page/models/forecast_day_model.dart';
import 'src/features/weather_home_page/models/forecast_model.dart';
import 'src/features/weather_home_page/models/hour_model.dart';
import 'src/features/weather_home_page/models/location_model.dart';
import 'src/features/weather_home_page/models/temperatures_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TemperaturesAdapter());
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(ConditionAdapter());
  Hive.registerAdapter(ForecastModelAdapter());
  Hive.registerAdapter(ForecastdayModelAdapter());
  Hive.registerAdapter(HourModelAdapter());
  Hive.registerAdapter(DayModelAdapter());
  Hive.registerAdapter(AstroModelAdapter());
  Hive.registerAdapter(UnitAdapter());
  Hive.registerAdapter(WindDirectionAdapter());
  Hive.registerAdapter(CityListModelAdapter());
  await Hive.openBox<Temperatures>('Temperature');
  await Hive.openBox<bool>('Alerts');
  await Hive.openBox<Unit>('Unit');
  await Hive.openBox<WindDirection>('WindDirection');
  await Hive.openBox<bool>('scaleIsDegree');
  await Hive.openLazyBox('CityList');

  runApp(
    const WeatherApp(),
  );
}
