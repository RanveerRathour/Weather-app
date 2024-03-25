// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourModelAdapter extends TypeAdapter<HourModel> {
  @override
  final int typeId = 9;

  @override
  HourModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourModel(
      chance_of_rain: fields[26] as int?,
      chance_of_snow: fields[28] as int?,
      cloud: fields[16] as int?,
      condition: fields[5] as Condition?,
      dewpoint_c: fields[23] as double?,
      dewpoint_f: fields[24] as double?,
      feelslike_c: fields[17] as double?,
      feelslike_f: fields[18] as double?,
      gust_kph: fields[32] as double?,
      gust_mph: fields[31] as double?,
      heatindex_c: fields[21] as double?,
      heatindex_f: fields[22] as double?,
      humidity: fields[15] as int?,
      is_day: fields[4] as int?,
      precip_in: fields[13] as double?,
      precip_mm: fields[12] as double?,
      pressure_in: fields[11] as double?,
      pressure_mb: fields[10] as double?,
      snow_cm: fields[14] as double?,
      temp_c: fields[2] as double?,
      temp_f: fields[3] as double?,
      time: fields[1] as String?,
      time_epoch: fields[0] as int?,
      uv: fields[33] as double?,
      vis_km: fields[29] as double?,
      vis_miles: fields[30] as double?,
      will_it_rain: fields[25] as int?,
      will_it_snow: fields[27] as int?,
      wind_degree: fields[8] as int?,
      wind_dir: fields[9] as String?,
      wind_kph: fields[7] as double?,
      wind_mph: fields[6] as double?,
      windchill_c: fields[19] as double?,
      windchill_f: fields[20] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HourModel obj) {
    writer
      ..writeByte(34)
      ..writeByte(0)
      ..write(obj.time_epoch)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.temp_c)
      ..writeByte(3)
      ..write(obj.temp_f)
      ..writeByte(4)
      ..write(obj.is_day)
      ..writeByte(5)
      ..write(obj.condition)
      ..writeByte(6)
      ..write(obj.wind_mph)
      ..writeByte(7)
      ..write(obj.wind_kph)
      ..writeByte(8)
      ..write(obj.wind_degree)
      ..writeByte(9)
      ..write(obj.wind_dir)
      ..writeByte(10)
      ..write(obj.pressure_mb)
      ..writeByte(11)
      ..write(obj.pressure_in)
      ..writeByte(12)
      ..write(obj.precip_mm)
      ..writeByte(13)
      ..write(obj.precip_in)
      ..writeByte(14)
      ..write(obj.snow_cm)
      ..writeByte(15)
      ..write(obj.humidity)
      ..writeByte(16)
      ..write(obj.cloud)
      ..writeByte(17)
      ..write(obj.feelslike_c)
      ..writeByte(18)
      ..write(obj.feelslike_f)
      ..writeByte(19)
      ..write(obj.windchill_c)
      ..writeByte(20)
      ..write(obj.windchill_f)
      ..writeByte(21)
      ..write(obj.heatindex_c)
      ..writeByte(22)
      ..write(obj.heatindex_f)
      ..writeByte(23)
      ..write(obj.dewpoint_c)
      ..writeByte(24)
      ..write(obj.dewpoint_f)
      ..writeByte(25)
      ..write(obj.will_it_rain)
      ..writeByte(26)
      ..write(obj.chance_of_rain)
      ..writeByte(27)
      ..write(obj.will_it_snow)
      ..writeByte(28)
      ..write(obj.chance_of_snow)
      ..writeByte(29)
      ..write(obj.vis_km)
      ..writeByte(30)
      ..write(obj.vis_miles)
      ..writeByte(31)
      ..write(obj.gust_mph)
      ..writeByte(32)
      ..write(obj.gust_kph)
      ..writeByte(33)
      ..write(obj.uv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourModel _$HourModelFromJson(Map<String, dynamic> json) => HourModel(
      chance_of_rain: json['chance_of_rain'] as int?,
      chance_of_snow: json['chance_of_snow'] as int?,
      cloud: json['cloud'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      dewpoint_c: (json['dewpoint_c'] as num?)?.toDouble(),
      dewpoint_f: (json['dewpoint_f'] as num?)?.toDouble(),
      feelslike_c: (json['feelslike_c'] as num?)?.toDouble(),
      feelslike_f: (json['feelslike_f'] as num?)?.toDouble(),
      gust_kph: (json['gust_kph'] as num?)?.toDouble(),
      gust_mph: (json['gust_mph'] as num?)?.toDouble(),
      heatindex_c: (json['heatindex_c'] as num?)?.toDouble(),
      heatindex_f: (json['heatindex_f'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      is_day: json['is_day'] as int?,
      precip_in: (json['precip_in'] as num?)?.toDouble(),
      precip_mm: (json['precip_mm'] as num?)?.toDouble(),
      pressure_in: (json['pressure_in'] as num?)?.toDouble(),
      pressure_mb: (json['pressure_mb'] as num?)?.toDouble(),
      snow_cm: (json['snow_cm'] as num?)?.toDouble(),
      temp_c: (json['temp_c'] as num?)?.toDouble(),
      temp_f: (json['temp_f'] as num?)?.toDouble(),
      time: json['time'] as String?,
      time_epoch: json['time_epoch'] as int?,
      uv: (json['uv'] as num?)?.toDouble(),
      vis_km: (json['vis_km'] as num?)?.toDouble(),
      vis_miles: (json['vis_miles'] as num?)?.toDouble(),
      will_it_rain: json['will_it_rain'] as int?,
      will_it_snow: json['will_it_snow'] as int?,
      wind_degree: json['wind_degree'] as int?,
      wind_dir: json['wind_dir'] as String?,
      wind_kph: (json['wind_kph'] as num?)?.toDouble(),
      wind_mph: (json['wind_mph'] as num?)?.toDouble(),
      windchill_c: (json['windchill_c'] as num?)?.toDouble(),
      windchill_f: (json['windchill_f'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourModelToJson(HourModel instance) => <String, dynamic>{
      'time_epoch': instance.time_epoch,
      'time': instance.time,
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
      'snow_cm': instance.snow_cm,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslike_c,
      'feelslike_f': instance.feelslike_f,
      'windchill_c': instance.windchill_c,
      'windchill_f': instance.windchill_f,
      'heatindex_c': instance.heatindex_c,
      'heatindex_f': instance.heatindex_f,
      'dewpoint_c': instance.dewpoint_c,
      'dewpoint_f': instance.dewpoint_f,
      'will_it_rain': instance.will_it_rain,
      'chance_of_rain': instance.chance_of_rain,
      'will_it_snow': instance.will_it_snow,
      'chance_of_snow': instance.chance_of_snow,
      'vis_km': instance.vis_km,
      'vis_miles': instance.vis_miles,
      'gust_mph': instance.gust_mph,
      'gust_kph': instance.gust_kph,
      'uv': instance.uv,
    };
