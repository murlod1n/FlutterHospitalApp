import "package:drift/drift.dart";
import "package:rxdart/rxdart.dart";
import "../../../domain/entity/doctor_entity.dart";
import "../../../domain/entity/record_entity.dart";
import "../../../domain/entity/service_entity.dart";
import "../database/database.dart";
import "../table/doctors.dart";
import "../table/hospital_services.dart";
import "../table/records.dart";

part "database_dao.g.dart";

@DriftAccessor(tables: <Type>[Records, HospitalServices, Doctors])
class DatabaseDao extends DatabaseAccessor<Database> with _$DatabaseDaoMixin {
  DatabaseDao(super.db);

  void deleteRecord({ required int id }) {
    (delete(records)..where((e) => e.id.equals(id))).go();
  }

  Future<void> insertRecord({ required RecordEntity entry }) {
    return transaction(() async {
      final DoctorEntity doctor = entry.doctor;


      final Record record = await into(records).insertReturning(
          RecordsCompanion.insert(
            date: entry.date,
          )
      );

      await into(doctors).insert(DoctorsCompanion.insert(
        kod: doctor.kod,
        name: doctor.name,
        filial: doctor.filial,
        dolzhnost: doctor.dolzhnost,
        img: doctor.img,
        active: doctor.active,
        del: doctor.del,
        recordId: record.id,
      ));
      for (final ServiceEntity service in entry.services) {
        await into(hospitalServices)
            .insertReturning(HospitalServicesCompanion.insert(
            kod: service.kod,
            name: service.name,
            active: service.active,
            del: service.del,
            price: service.price,
            recordId: record.id));
      }
    });
  }


  Stream<List<RecordEntity>> getAllRecords() {
    final Stream<List<Record>> recordsStream = select(records).watch();

    return recordsStream.switchMap((List<Record> recordList) {
      final Map<int, Record> idToRecord = {
        for(final Record record in recordList) record.id: record
      };
      final Iterable<int> ids = idToRecord.keys;

      final query = select(records).join([
        innerJoin(doctors, doctors.recordId.equalsExp(records.id)),
        innerJoin(
            hospitalServices, hospitalServices.recordId.equalsExp(records.id))
      ]);


      return query.watch().map((List<TypedResult> rows) {
        final Map<int, List<ServiceEntity>> idToService = <int,
            List<ServiceEntity>>{};
        final Map<int, DoctorEntity> idToDoctor = <int, DoctorEntity>{};
        for (final TypedResult row in rows) {
          final HospitalService hospitalService = row.readTable(
              hospitalServices);
          final Doctor doctor = row.readTable(doctors);

          idToDoctor.putIfAbsent(doctor.recordId, () => DoctorEntity(
              id: doctor.id,
              kod: doctor.kod,
              name: doctor.name,
              filial: doctor.filial,
              dolzhnost: doctor.dolzhnost,
              img: doctor.img,
              active: doctor.active,
              del: doctor.del
          ));

          idToService.putIfAbsent(
              hospitalService.recordId, () => <ServiceEntity>[]).add(
              ServiceEntity(
                  id: hospitalService.id,
                  kod: hospitalService.kod,
                  name: hospitalService.name,
                  active: hospitalService.active,
                  del: hospitalService.del,
                  price: hospitalService.price
              )
          );
        }
        return <RecordEntity>[
          for(final int id in ids)
            RecordEntity(
                id: id,
                date: idToRecord[id]!.date,
                doctor: DoctorEntity(
                    id: idToDoctor[id]!.id,
                    kod: idToDoctor[id]!.kod,
                    name: idToDoctor[id]!.name,
                    filial: idToDoctor[id]!.filial,
                    dolzhnost: idToDoctor[id]!.dolzhnost,
                    img: idToDoctor[id]!.img,
                    active: idToDoctor[id]!.active,
                    del: idToDoctor[id]!.del),
                services: idToService[id] ?? <ServiceEntity>[]
            )
        ];
      });
    });
  }
}
