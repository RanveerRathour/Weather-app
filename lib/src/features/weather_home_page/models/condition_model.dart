import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'condition_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Condition {
  @HiveField(0)
  final String? text;
  @HiveField(1)
  final String? icon;
  @HiveField(2)
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
