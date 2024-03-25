// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 3;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      last_updated: fields[0] as String?,
      temp_c: fields[1] as double?,
      temp_f: fields[2] as double?,
      is_day: fields[3] as int?,
      condition: fields[4] as Condition?,
      wind_mph: fields[5] as double?,
      wind_kph: fields[6] as double?,
      wind_degree: fields[7] as int?,
      wind_dir: fields[8] as String?,
      pressure_mb: fields[9] as double?,
      pressure_in: fields[10] as double?,
      precip_mm: fields[11] as double?,
      precip_in: fields[12] as double?,
      humidity: fields[13] as int?,
      cloud: fields[14] as int?,
      feelslike_c: fields[15] as double?,
      feelslike_f: fields[16] as double?,
      vis_km: fields[17] as double?,
      vis_miles: fields[18] as double?,
      uv: fields[19] as double?,
      gust_mph: fields[20] as double?,
      gust_kph: fields[21] as double?,
      air_quality: (fields[22] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.last_updated)
      ..writeByte(1)
      ..write(obj.temp_c)
      ..writeByte(2)
      ..write(obj.temp_f)
      ..writeByte(3)
      ..write(obj.is_day)
      ..writeByte(4)
      ..write(obj.condition)
      ..writeByte(5)
      ..write(obj.wind_mph)
      ..writeByte(6)
      ..write(obj.wind_kph)
      ..writeByte(7)
      ..write(obj.wind_degree)
      ..writeByte(8)
      ..write(obj.wind_dir)
      ..writeByte(9)
      ..write(obj.pressure_mb)
      ..writeByte(10)
      ..write(obj.pressure_in)
      ..writeByte(11)
      ..write(obj.precip_mm)
      ..writeByte(12)
      ..write(obj.precip_in)
      ..writeByte(13)
      ..write(obj.humidity)
      ..writeByte(14)
      ..write(obj.cloud)
      ..writeByte(15)
      ..write(obj.feelslike_c)
      ..writeByte(16)
      ..write(obj.feelslike_f)
      ..writeByte(17)
      ..write(obj.vis_km)
      ..writeByte(18)
      ..write(obj.vis_miles)
      ..writeByte(19)
      ..write(obj.uv)
      ..writeByte(20)
      ..write(obj.gust_mph)
      ..writeByte(21)
      ..write(obj.gust_kph)
      ..writeByte(22)
      ..write(obj.air_quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      last_updated: json['last_updated'] as String?,
      temp_c: (json['temp_c'] as num?)?.toDouble(),
      temp_f: (json['temp_f'] as num?)?.toDouble(),
      is_day: json['is_day'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      wind_mph: (json['wind_mph'] as num?)?.toDouble(),
      wind_kph: (json['wind_kph'] as num?)?.toDouble(),
      wind_degree: json['wind_degree'] as int?,
      wind_dir: json['wind_dir'] as String?,
      pressure_mb: (json['pressure_mb'] as num?)?.toDouble(),
      pressure_in: (json['pressure_in'] as num?)?.toDouble(),
      precip_mm: (json['precip_mm'] as num?)?.toDouble(),
      precip_in: (json['precip_in'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslike_c: (json['feelslike_c'] as num?)?.toDouble(),
      feelslike_f: (json['feelslike_f'] as num?)?.toDouble(),
      vis_km: (json['vis_km'] as num?)?.toDouble(),
      vis_miles: (json['vis_miles'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      gust_mph: (json['gust_mph'] as num?)?.toDouble(),
      gust_kph: (json['gust_kph'] as num?)?.toDouble(),
      air_quality: json['air_quality'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'last_updated': instance.last_updated,
      'temp_c': instance.temp_c,
      'temp_f': instance.temp_f,
      'is_day': instance.is_day,
      'condition': instance.condition,
      'wind_mph': instance.wind_mph,
      'wind_kph': instance.wind_kph,
      'wind_degree': instance.wind_degree,
      'wind_dir': instance.wind_dir,
      'pressure_mb': instance.pressure_mb,
      'pressure_in': instance.pressure_in,
      'precip_mm': instance.precip_mm,
      'precip_in': instance.precip_in,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslike_c,
      'feelslike_f': instance.feelslike_f,
      'vis_km': instance.vis_km,
      'vis_miles': instance.vis_miles,
      'uv': instance.uv,
      'gust_mph': instance.gust_mph,
      'gust_kph': instance.gust_kph,
      'air_quality': instance.air_quality,
    };
