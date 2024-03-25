import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'astro_model.dart';
import 'day_model.dart';
import 'hour_model.dart';
part 'forecast_day_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class ForecastdayModel {
  @HiveField(0)
  String? date;
  @HiveField(1)
  int? dateEpoch;
  @HiveField(2)
  DayModel? day;
  @HiveField(3)
  AstroModel? astro;
  @HiveField(4)
  List<HourModel>? hour;

  ForecastdayModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayModelToJson(this);
}
