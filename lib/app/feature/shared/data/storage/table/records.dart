import "package:drift/drift.dart";

import "doctors.dart";
import "hospital_services.dart";

@DataClassName("Record")
class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
  IntColumn get doctor => integer().references(Doctors, #id)();
  IntColumn get service => integer().references(HospitalServices, #id)();
}
