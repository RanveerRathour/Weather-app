import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Location {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? region;
  @HiveField(2)
  final String? country;
  @HiveField(3)
  final double? lat;
  @HiveField(4)
  final double? lon;
  @HiveField(5)
  final String? tzId;
  @HiveField(6)
  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtime,
  });

  // Override == and hashCode methods
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lon == other.lon;

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
