// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 0;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      name: fields[0] as String,
      type: fields[1] as String,
      side: fields[2] as String,
      anatomy: fields[3] as String,
      symptom: fields[4] as String,
      holdFor: fields[5] as int,
      repeatFor: fields[6] as int,
      doPerDay: fields[7] as int,
      imagePath: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.side)
      ..writeByte(3)
      ..write(obj.anatomy)
      ..writeByte(4)
      ..write(obj.symptom)
      ..writeByte(5)
      ..write(obj.holdFor)
      ..writeByte(6)
      ..write(obj.repeatFor)
      ..writeByte(7)
      ..write(obj.doPerDay)
      ..writeByte(8)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
