// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CredentialResultHiveAdapter extends TypeAdapter<CredentialResultHive> {
  @override
  final int typeId = 0;

  @override
  CredentialResultHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CredentialResultHive(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CredentialResultHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.appId)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CredentialResultHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
