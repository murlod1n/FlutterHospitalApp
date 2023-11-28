import "package:drift/drift.dart";
import "package:rxdart/rxdart.dart";
import "../database/database.dart";
import "../entity/doctor_entity.dart";
import "../entity/record_entity.dart";
import "../entity/service_entity.dart";
import "../table/doctors.dart";
import "../table/hospital_services.dart";
import "../table/records.dart";

part 'database_dao.g.dart';

@DriftAccessor(tables: [Records, HospitalServices, Doctors])
class DatabaseDao extends DatabaseAccessor<Database> with _$DatabaseDaoMixin {
  DatabaseDao(super.db);


  Future<void> insertRecord(RecordEntity entry) {
    return transaction(() async {
      final DoctorEntity doctor = entry.doctor;
      final Doctor addedDoctor =
      await into(doctors).insertReturning(DoctorsCompanion.insert(
        kod: doctor.kod,
        name: doctor.name,
        filial: doctor.filial,
        dolzhnost: doctor.dolzhnost,
        img: doctor.img,
        active: doctor.active,
        del: doctor.del,
      ));
      for (final ServiceEntity service in entry.services) {
        final HospitalService addedService = await into(hospitalServices)
            .insertReturning(HospitalServicesCompanion.insert(
            kod: service.kod,
            name: service.name,
            active: service.active,
            del: service.del,
            price: service.price));

        await into(records).insert(RecordsCompanion.insert(
            date: "10:11", doctor: addedDoctor.id, service: addedService.id));
      }
    });
  }


  Stream<List<RecordEntity>> watchAllRecords() {
    final Stream<List<Doctor>> doctorStream = select(doctors).watch();

    return doctorStream.switchMap((List<Doctor> doctorList) {
      final Map<int, Doctor> idToDoctor = {
        for (final Doctor doctor in doctorList) doctor.id: doctor
      };
      final Iterable<int> ids = idToDoctor.keys;

      final JoinedSelectStatement<HasResultSet, dynamic> query = select(records).join(<Join<HasResultSet, dynamic>>[
        innerJoin(
            hospitalServices, hospitalServices.id.equalsExp(records.service)),
      ])
        ..where(records.doctor.isIn(ids));

      return query.watch().map((List<TypedResult> rows) {
        final Map<int, List<ServiceEntity>> idToService = <int, List<ServiceEntity>>{};

        for (final TypedResult row in rows) {

          final HospitalService hospitalService = row.readTable(hospitalServices);
          final int doctorId = row.readTable(records).doctor;

          idToService.putIfAbsent(doctorId, () => <ServiceEntity>[]).add(ServiceEntity(
              id: hospitalService.id,
              kod: hospitalService.kod,
              name: hospitalService.name,
              active: hospitalService.active,
              del: hospitalService.del,
              price: hospitalService.price));
        }

        return [
          for(final int id in ids) RecordEntity(id: 0, date: "test", doctor: DoctorEntity(
              id: idToDoctor[id]!.id,
              kod: idToDoctor[id]!.kod,
              name: idToDoctor[id]!.name,
              filial: idToDoctor[id]!.filial,
              dolzhnost: idToDoctor[id]!.dolzhnost,
              img: idToDoctor[id]!.img,
              active: idToDoctor[id]!.active,
              del: idToDoctor[id]!.del), services: idToService[id] ?? <ServiceEntity>[])
        ];
      });
    });
  }


}