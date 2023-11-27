import "../../domain/model/doctor.dart";
import "../../domain/model/hospital_record.dart";
import "../../domain/model/service.dart";
import "../model/doctor_ui.dart";
import "../model/hospital_record_ui.dart";
import "../model/service_ui.dart";

extension ToDoctorUI on Doctor {
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

extension ToDoctor on DoctorUI {
  Doctor toDoctor() {
    return Doctor(
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


extension ToServiceUI on Service {
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



extension ToHospitalRecordUI on HospitalRecord {
  HospitalRecordUI toHospitalRecordUI() {
    return HospitalRecordUI(
        doctor: doctor.toDoctorUI(),
        services: services,
        date: date,
        time: time
    );
  }
}


extension ToHospitalRecord on HospitalRecordUI {
  HospitalRecord toHospitalRecord() {
    return HospitalRecord(
        doctor: doctor.toDoctor(),
        services: services,
        date: date,
        time: time
    );
  }
}