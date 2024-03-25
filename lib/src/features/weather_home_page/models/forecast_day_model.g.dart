// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastdayModelAdapter extends TypeAdapter<ForecastdayModel> {
  @override
  final int typeId = 6;

  @override
  ForecastdayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastdayModel(
      date: fields[0] as String?,
      dateEpoch: fields[1] as int?,
      day: fields[2] as DayModel?,
      astro: fields[3] as AstroModel?,
      hour: (fields[4] as List?)?.cast<HourModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ForecastdayModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateEpoch)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.astro)
      ..writeByte(4)
      ..write(obj.hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastdayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastdayModel _$ForecastdayModelFromJson(Map<String, dynamic> json) =>
    ForecastdayModel(
      date: json['date'] as String?,
      dateEpoch: json['dateEpoch'] as int?,
      day: json['day'] == null
          ? null
          : DayModel.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : AstroModel.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => HourModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayModelToJson(ForecastdayModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dateEpoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
