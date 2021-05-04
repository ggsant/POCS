// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CredentialResultAdapter extends TypeAdapter<CredentialResult> {
  @override
  final int typeId = 1;

  @override
  CredentialResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CredentialResult(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CredentialResult obj) {
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
      other is CredentialResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
