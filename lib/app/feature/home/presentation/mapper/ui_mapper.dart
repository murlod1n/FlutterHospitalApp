import "../../domain/model/doctor.dart";
import "../../domain/model/service.dart";
import "../model/doctor_ui.dart";
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
