import "package:drift/drift.dart";


class HospitalServices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get kod => integer()();
  TextColumn get name => text()();
  TextColumn get active => text()();
  TextColumn get del => text()();
  TextColumn get price => text()();

}
