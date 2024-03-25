// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayModelAdapter extends TypeAdapter<DayModel> {
  @override
  final int typeId = 7;

  @override
  DayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayModel(
      avghumidity: fields[13] as int?,
      avgtemp_c: fields[4] as double?,
      avgtemp_f: fields[5] as double?,
      avgvis_km: fields[11] as double?,
      avgvis_miles: fields[12] as double?,
      daily_chance_of_rain: fields[15] as int?,
      condition: fields[18] as Condition?,
      daily_chance_of_snow: fields[17] as int?,
      daily_will_it_rain: fields[14] as int?,
      daily_will_it_snow: fields[16] as int?,
      maxtemp_c: fields[0] as double?,
      maxtemp_f: fields[1] as double?,
      maxwind_kph: fields[7] as double?,
      maxwind_mph: fields[6] as double?,
      mintemp_c: fields[2] as double?,
      mintemp_f: fields[3] as double?,
      totalprecip_in: fields[9] as double?,
      totalprecip_mm: fields[8] as double?,
      totalsnow_cm: fields[10] as double?,
      uv: fields[19] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DayModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.maxtemp_c)
      ..writeByte(1)
      ..write(obj.maxtemp_f)
      ..writeByte(2)
      ..write(obj.mintemp_c)
      ..writeByte(3)
      ..write(obj.mintemp_f)
      ..writeByte(4)
      ..write(obj.avgtemp_c)
      ..writeByte(5)
      ..write(obj.avgtemp_f)
      ..writeByte(6)
      ..write(obj.maxwind_mph)
      ..writeByte(7)
      ..write(obj.maxwind_kph)
      ..writeByte(8)
      ..write(obj.totalprecip_mm)
      ..writeByte(9)
      ..write(obj.totalprecip_in)
      ..writeByte(10)
      ..write(obj.totalsnow_cm)
      ..writeByte(11)
      ..write(obj.avgvis_km)
      ..writeByte(12)
      ..write(obj.avgvis_miles)
      ..writeByte(13)
      ..write(obj.avghumidity)
      ..writeByte(14)
      ..write(obj.daily_will_it_rain)
      ..writeByte(15)
      ..write(obj.daily_chance_of_rain)
      ..writeByte(16)
      ..write(obj.daily_will_it_snow)
      ..writeByte(17)
      ..write(obj.daily_chance_of_snow)
      ..writeByte(18)
      ..write(obj.condition)
      ..writeByte(19)
      ..write(obj.uv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModel _$DayModelFromJson(Map<String, dynamic> json) => DayModel(
      avghumidity: json['avghumidity'] as int?,
      avgtemp_c: (json['avgtemp_c'] as num?)?.toDouble(),
      avgtemp_f: (json['avgtemp_f'] as num?)?.toDouble(),
      avgvis_km: (json['avgvis_km'] as num?)?.toDouble(),
      avgvis_miles: (json['avgvis_miles'] as num?)?.toDouble(),
      daily_chance_of_rain: json['daily_chance_of_rain'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      daily_chance_of_snow: json['daily_chance_of_snow'] as int?,
      daily_will_it_rain: json['daily_will_it_rain'] as int?,
      daily_will_it_snow: json['daily_will_it_snow'] as int?,
      maxtemp_c: (json['maxtemp_c'] as num?)?.toDouble(),
      maxtemp_f: (json['maxtemp_f'] as num?)?.toDouble(),
      maxwind_kph: (json['maxwind_kph'] as num?)?.toDouble(),
      maxwind_mph: (json['maxwind_mph'] as num?)?.toDouble(),
      mintemp_c: (json['mintemp_c'] as num?)?.toDouble(),
      mintemp_f: (json['mintemp_f'] as num?)?.toDouble(),
      totalprecip_in: (json['totalprecip_in'] as num?)?.toDouble(),
      totalprecip_mm: (json['totalprecip_mm'] as num?)?.toDouble(),
      totalsnow_cm: (json['totalsnow_cm'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtemp_c,
      'maxtemp_f': instance.maxtemp_f,
      'mintemp_c': instance.mintemp_c,
      'mintemp_f': instance.mintemp_f,
      'avgtemp_c': instance.avgtemp_c,
      'avgtemp_f': instance.avgtemp_f,
      'maxwind_mph': instance.maxwind_mph,
      'maxwind_kph': instance.maxwind_kph,
      'totalprecip_mm': instance.totalprecip_mm,
      'totalprecip_in': instance.totalprecip_in,
      'totalsnow_cm': instance.totalsnow_cm,
      'avgvis_km': instance.avgvis_km,
      'avgvis_miles': instance.avgvis_miles,
      'avghumidity': instance.avghumidity,
      'daily_will_it_rain': instance.daily_will_it_rain,
      'daily_chance_of_rain': instance.daily_chance_of_rain,
      'daily_will_it_snow': instance.daily_will_it_snow,
      'daily_chance_of_snow': instance.daily_chance_of_snow,
      'condition': instance.condition,
      'uv': instance.uv,
    };
