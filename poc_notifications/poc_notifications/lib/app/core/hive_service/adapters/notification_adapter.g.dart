// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationResultHiveAdapter
    extends TypeAdapter<NotificationResultHive> {
  @override
  final int typeId = 1;

  @override
  NotificationResultHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationResultHive(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationResultHive obj) {
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
      other is NotificationResultHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
