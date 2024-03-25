// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_constant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitAdapter extends TypeAdapter<Unit> {
  @override
  final int typeId = 10;

  @override
  Unit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Unit.imperial;
      case 1:
        return Unit.metric;
      case 2:
        return Unit.hybrid;
      default:
        return Unit.imperial;
    }
  }

  @override
  void write(BinaryWriter writer, Unit obj) {
    switch (obj) {
      case Unit.imperial:
        writer.writeByte(0);
        break;
      case Unit.metric:
        writer.writeByte(1);
        break;
      case Unit.hybrid:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindDirectionAdapter extends TypeAdapter<WindDirection> {
  @override
  final int typeId = 11;

  @override
  WindDirection read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WindDirection.cardinal;
      case 1:
        return WindDirection.degrees;
      default:
        return WindDirection.cardinal;
    }
  }

  @override
  void write(BinaryWriter writer, WindDirection obj) {
    switch (obj) {
      case WindDirection.cardinal:
        writer.writeByte(0);
        break;
      case WindDirection.degrees:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindDirectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
