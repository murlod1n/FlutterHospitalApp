import "package:drift/drift.dart";
import "package:hospital_app/app/feature/shared/data/storage/table/records.dart";

class Doctors extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get kod => integer()();
  TextColumn get name => text()();
  TextColumn get filial => text()();
  TextColumn get dolzhnost => text()();
  TextColumn get img => text()();
  TextColumn get active => text()();
  TextColumn get del => text()();
  IntColumn get recordId => integer().references(Records, #id, onDelete: KeyAction.cascade)();
}
