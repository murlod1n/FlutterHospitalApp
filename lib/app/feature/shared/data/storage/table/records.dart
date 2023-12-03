import "package:drift/drift.dart";

@DataClassName("Record")
class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
}
