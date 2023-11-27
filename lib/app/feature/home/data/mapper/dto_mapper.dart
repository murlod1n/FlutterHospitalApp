import "../../domain/model/doctor.dart";
import "../../domain/model/hospital_record.dart";
import "../../domain/model/service.dart";
import "../api/model/doctor_dto/doctor_dto.dart";
import "../api/model/record_dto/record_dto.dart";
import "../api/model/service_dto/service_dto.dart";

extension ToDoctor on DoctorDto {
  Doctor toDoctor() {
    return Doctor(
        kod: int.parse(kod),
        name: name,
        filial: filial,
        dolzhnost: dolzhnost,
        img: img,
        active: active,
        del: del);
  }
}

extension ToDoctorDto on Doctor {
  DoctorDto toDoctorDto() {
    return DoctorDto(
        kod: kod.toString(),
        name: name,
        filial: filial,
        dolzhnost: dolzhnost,
        img: img,
        active: active,
        del: del
    );
  }
}


extension ToService on ServiceDto {
  Service toService() {
    return Service(
        kod: int.parse(kod),
        name: name,
        active: active,
        del: del,
        price: price
    );
  }
}

extension ToHospitalRecord on RecordDto {
  HospitalRecord toHospitalRecord() {
    return HospitalRecord(
        doctor: doctor.toDoctor(),
        services: services,
        date: date,
        time: time
    );
  }
}

extension ToRecordDto on HospitalRecord {
  RecordDto toRecordDto() {
    return RecordDto(
        doctor: doctor.toDoctorDto(),
        services: services,
        date: date,
        time: time
    );
  }
}

