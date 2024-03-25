// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'condition_model.dart';
part 'day_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class DayModel {
  @HiveField(0)
  double? maxtemp_c;
  @HiveField(1)
  double? maxtemp_f;
  @HiveField(2)
  double? mintemp_c;
  @HiveField(3)
  double? mintemp_f;
  @HiveField(4)
  double? avgtemp_c;
  @HiveField(5)
  double? avgtemp_f;
  @HiveField(6)
  double? maxwind_mph;
  @HiveField(7)
  double? maxwind_kph;
  @HiveField(8)
  double? totalprecip_mm;
  @HiveField(9)
  double? totalprecip_in;
  @HiveField(10)
  double? totalsnow_cm;
  @HiveField(11)
  double? avgvis_km;
  @HiveField(12)
  double? avgvis_miles;
  @HiveField(13)
  int? avghumidity;
  @HiveField(14)
  int? daily_will_it_rain;
  @HiveField(15)
  int? daily_chance_of_rain;
  @HiveField(16)
  int? daily_will_it_snow;
  @HiveField(17)
  int? daily_chance_of_snow;
  @HiveField(18)
  Condition? condition;
  @HiveField(19)
  double? uv;

  DayModel({
    this.avghumidity,
    this.avgtemp_c,
    this.avgtemp_f,
    this.avgvis_km,
    this.avgvis_miles,
    this.daily_chance_of_rain,
    this.condition,
    this.daily_chance_of_snow,
    this.daily_will_it_rain,
    this.daily_will_it_snow,
    this.maxtemp_c,
    this.maxtemp_f,
    this.maxwind_kph,
    this.maxwind_mph,
    this.mintemp_c,
    this.mintemp_f,
    this.totalprecip_in,
    this.totalprecip_mm,
    this.totalsnow_cm,
    this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);
  Map<String, dynamic> toJson() => _$DayModelToJson(this);
}
