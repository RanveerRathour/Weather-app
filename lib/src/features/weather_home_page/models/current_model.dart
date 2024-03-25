// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'condition_model.dart';
part 'current_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Current {
  @HiveField(0)
  final String? last_updated;
  @HiveField(1)
  final double? temp_c;
  @HiveField(2)
  final double? temp_f;
  @HiveField(3)
  final int? is_day;
  @HiveField(4)
  final Condition? condition;
  @HiveField(5)
  final double? wind_mph;
  @HiveField(6)
  final double? wind_kph;
  @HiveField(7)
  final int? wind_degree;
  @HiveField(8)
  final String? wind_dir;
  @HiveField(9)
  final double? pressure_mb;
  @HiveField(10)
  final double? pressure_in;
  @HiveField(11)
  final double? precip_mm;
  @HiveField(12)
  final double? precip_in;
  @HiveField(13)
  final int? humidity;
  @HiveField(14)
  final int? cloud;
  @HiveField(15)
  final double? feelslike_c;
  @HiveField(16)
  final double? feelslike_f;
  @HiveField(17)
  final double? vis_km;
  @HiveField(18)
  final double? vis_miles;
  @HiveField(19)
  final double? uv;
  @HiveField(20)
  final double? gust_mph;
  @HiveField(21)
  final double? gust_kph;
  @HiveField(22)
  final Map<String, dynamic>? air_quality;

  Current({
    this.last_updated,
    this.temp_c,
    this.temp_f,
    this.is_day,
    this.condition,
    this.wind_mph,
    this.wind_kph,
    this.wind_degree,
    this.wind_dir,
    this.pressure_mb,
    this.pressure_in,
    this.precip_mm,
    this.precip_in,
    this.humidity,
    this.cloud,
    this.feelslike_c,
    this.feelslike_f,
    this.vis_km,
    this.vis_miles,
    this.uv,
    this.gust_mph,
    this.gust_kph,
    this.air_quality,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
