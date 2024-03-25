import 'package:hive/hive.dart';
part 'settings_constant.g.dart';

@HiveType(typeId: 10)
enum Unit {
  @HiveField(0)
  imperial,
  @HiveField(1)
  metric,
  @HiveField(2)
  hybrid,
}

@HiveType(typeId: 11)
enum WindDirection {
  @HiveField(0)
  cardinal,
  @HiveField(1)
  degrees,
}
