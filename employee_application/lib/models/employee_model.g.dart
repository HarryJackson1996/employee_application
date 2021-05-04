// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeCategoryAdapter extends TypeAdapter<EmployeeCategory> {
  @override
  final int typeId = 2;

  @override
  EmployeeCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmployeeCategory.IT;
      case 1:
        return EmployeeCategory.HR;
      default:
        return EmployeeCategory.IT;
    }
  }

  @override
  void write(BinaryWriter writer, EmployeeCategory obj) {
    switch (obj) {
      case EmployeeCategory.IT:
        writer.writeByte(0);
        break;
      case EmployeeCategory.HR:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmployeesAdapter extends TypeAdapter<Employees> {
  @override
  final int typeId = 0;

  @override
  Employees read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employees(
      employees: (fields[0] as List)?.cast<Employee>(),
    );
  }

  @override
  void write(BinaryWriter writer, Employees obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.employees);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 1;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      category: fields[3] as EmployeeCategory,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
