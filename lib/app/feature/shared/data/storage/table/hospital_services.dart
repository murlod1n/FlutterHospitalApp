import "package:drift/drift.dart";
import "records.dart";


class HospitalServices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get kod => integer()();
  TextColumn get name => text()();
  TextColumn get active => text()();
  TextColumn get del => text()();
  TextColumn get price => text()();
  IntColumn get recordId => integer().references(Records, #id, onDelete: KeyAction.cascade)();

}
