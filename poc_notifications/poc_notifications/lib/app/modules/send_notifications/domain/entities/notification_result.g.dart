// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationResultAdapter extends TypeAdapter<NotificationResult> {
  @override
  final int typeId = 1;

  @override
  NotificationResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationResult(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationResult obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
