import "dart:io";
import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart";
import "../table/doctors.dart";
import "../table/hospital_services.dart";
import "../table/records.dart";

part "database.g.dart";

@DriftDatabase(tables: [Records, HospitalServices, Doctors])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;



}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
