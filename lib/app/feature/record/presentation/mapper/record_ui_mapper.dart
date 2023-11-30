import "../../../shared/domain/entity/doctor_entity.dart";
import "../../../shared/domain/entity/record_entity.dart";
import "../../../shared/domain/entity/service_entity.dart";
import "../../../shared/presentation/model/doctor_ui.dart";
import "../../../shared/presentation/model/service_ui.dart";
import "../model/record_to_doctor_ui.dart";

extension ToDoctorUI on DoctorEntity {
  DoctorUI toDoctorUI() {
    return DoctorUI(
        kod: kod,
        name: name,
        filial: filial,
        dolzhnost: dolzhnost,
        img: img,
        active: active,
        del: del
    );
  }
}

extension ToServiceUI on ServiceEntity {
  ServiceUI toServiceUI() {
    return ServiceUI(
        kod: kod,
        name: name,
        active: active,
        del: del,
        price: price
    );
  }
}

extension ToRecordToDoctorUI on RecordEntity {
  RecordToDoctorUI toRecordToDoctorUI() {
    return RecordToDoctorUI(
        doctor: doctor.toDoctorUI(),
        services: services.map((e) => e.toServiceUI()).toList(),
        date: date,
    );
  }
}
