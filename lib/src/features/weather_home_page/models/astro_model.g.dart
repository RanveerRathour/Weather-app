// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AstroModelAdapter extends TypeAdapter<AstroModel> {
  @override
  final int typeId = 8;

  @override
  AstroModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AstroModel(
      sunrise: fields[0] as String?,
      sunset: fields[1] as String?,
      moonrise: fields[2] as String?,
      moonset: fields[3] as String?,
      moon_phase: fields[4] as String?,
      moon_illumination: fields[5] as double?,
      isMoonUp: fields[6] as int?,
      isSunUp: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AstroModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sunrise)
      ..writeByte(1)
      ..write(obj.sunset)
      ..writeByte(2)
      ..write(obj.moonrise)
      ..writeByte(3)
      ..write(obj.moonset)
      ..writeByte(4)
      ..write(obj.moon_phase)
      ..writeByte(5)
      ..write(obj.moon_illumination)
      ..writeByte(6)
      ..write(obj.isMoonUp)
      ..writeByte(7)
      ..write(obj.isSunUp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstroModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroModel _$AstroModelFromJson(Map<String, dynamic> json) => AstroModel(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moon_phase: json['moon_phase'] as String?,
      moon_illumination: (json['moon_illumination'] as num?)?.toDouble(),
      isMoonUp: json['isMoonUp'] as int?,
      isSunUp: json['isSunUp'] as int?,
    );

Map<String, dynamic> _$AstroModelToJson(AstroModel instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moon_phase,
      'moon_illumination': instance.moon_illumination,
      'isMoonUp': instance.isMoonUp,
      'isSunUp': instance.isSunUp,
    };
