// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'astro_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class AstroModel {
  @HiveField(0)
  String? sunrise;
  @HiveField(1)
  String? sunset;
  @HiveField(2)
  String? moonrise;
  @HiveField(3)
  String? moonset;
  @HiveField(4)
  String? moon_phase;
  @HiveField(5)
  double? moon_illumination;
  @HiveField(6)
  int? isMoonUp;
  @HiveField(7)
  int? isSunUp;

  AstroModel({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moon_phase,
    this.moon_illumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) =>
      _$AstroModelFromJson(json);

  Map<String, dynamic> toJson() => _$AstroModelToJson(this);
}
