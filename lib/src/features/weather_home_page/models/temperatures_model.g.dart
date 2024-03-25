// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperatures_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemperaturesAdapter extends TypeAdapter<Temperatures> {
  @override
  final int typeId = 1;

  @override
  Temperatures read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temperatures(
      location: fields[0] as Location?,
      current: fields[1] as Current?,
      forecast: fields[2] as ForecastModel?,
    );
  }

  @override
  void write(BinaryWriter writer, Temperatures obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.current)
      ..writeByte(2)
      ..write(obj.forecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemperaturesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperatures _$TemperaturesFromJson(Map<String, dynamic> json) => Temperatures(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperaturesToJson(Temperatures instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
