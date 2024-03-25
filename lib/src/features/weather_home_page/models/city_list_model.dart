import 'package:hive/hive.dart';

import 'temperatures_model.dart';
part 'city_list_model.g.dart';

@HiveType(typeId: 12)
class CityListModel {
  const CityListModel({this.listOfCity = const <Temperatures>[]});
  @HiveField(0)
  final List<Temperatures> listOfCity;
}
