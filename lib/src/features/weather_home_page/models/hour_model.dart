// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'condition_model.dart';
part 'hour_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class HourModel {
  @HiveField(0)
  int? time_epoch;
  @HiveField(1)
  String? time;
  @HiveField(2)
  double? temp_c;
  @HiveField(3)
  double? temp_f;
  @HiveField(4)
  int? is_day;
  @HiveField(5)
  Condition? condition;
  @HiveField(6)
  double? wind_mph;
  @HiveField(7)
  double? wind_kph;
  @HiveField(8)
  int? wind_degree;
  @HiveField(9)
  String? wind_dir;
  @HiveField(10)
  double? pressure_mb;
  @HiveField(11)
  double? pressure_in;
  @HiveField(12)
  double? precip_mm;
  @HiveField(13)
  double? precip_in;
  @HiveField(14)
  double? snow_cm;
  @HiveField(15)
  int? humidity;
  @HiveField(16)
  int? cloud;
  @HiveField(17)
  double? feelslike_c;
  @HiveField(18)
  double? feelslike_f;
  @HiveField(19)
  double? windchill_c;
  @HiveField(20)
  double? windchill_f;
  @HiveField(21)
  double? heatindex_c;
  @HiveField(22)
  double? heatindex_f;
  @HiveField(23)
  double? dewpoint_c;
  @HiveField(24)
  double? dewpoint_f;
  @HiveField(25)
  int? will_it_rain;
  @HiveField(26)
  int? chance_of_rain;
  @HiveField(27)
  int? will_it_snow;
  @HiveField(28)
  int? chance_of_snow;
  @HiveField(29)
  double? vis_km;
  @HiveField(30)
  double? vis_miles;
  @HiveField(31)
  double? gust_mph;
  @HiveField(32)
  double? gust_kph;
  @HiveField(33)
  double? uv;

  HourModel({
    this.chance_of_rain,
    this.chance_of_snow,
    this.cloud,
    this.condition,
    this.dewpoint_c,
    this.dewpoint_f,
    this.feelslike_c,
    this.feelslike_f,
    this.gust_kph,
    this.gust_mph,
    this.heatindex_c,
    this.heatindex_f,
    this.humidity,
    this.is_day,
    this.precip_in,
    this.precip_mm,
    this.pressure_in,
    this.pressure_mb,
    this.snow_cm,
    this.temp_c,
    this.temp_f,
    this.time,
    this.time_epoch,
    this.uv,
    this.vis_km,
    this.vis_miles,
    this.will_it_rain,
    this.will_it_snow,
    this.wind_degree,
    this.wind_dir,
    this.wind_kph,
    this.wind_mph,
    this.windchill_c,
    this.windchill_f,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) =>
      _$HourModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourModelToJson(this);
}
