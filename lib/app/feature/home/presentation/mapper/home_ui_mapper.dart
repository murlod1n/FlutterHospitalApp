import "../../../home/domain/model/doctor.dart";
import "../../../home/domain/model/record_to_doctor.dart";
import "../../../home/domain/model/service.dart";
import "../../../shared/presentation/model/doctor_ui.dart";
import "../model/home_record_ui.dart";
import "../../../shared/presentation/model/service_ui.dart";


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



extension ToRecordToDoctorUI on RecordToDoctor {
  HomeRecordUI toRecordToDoctorUI() {
    return HomeRecordUI(
        doctor: doctor.toDoctorUI(),
        services: services,
        date: date,
        time: time
    );
  }
}


extension ToRecordToDoctor on HomeRecordUI {
  RecordToDoctor toRecordToDoctor() {
    return RecordToDoctor(
        doctor: doctor.toDoctor(),
        services: services,
        date: date,
        time: time
    );
  }
}