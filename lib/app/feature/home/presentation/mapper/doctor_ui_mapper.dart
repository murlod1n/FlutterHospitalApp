import "../../domain/model/doctor.dart";
import "../model/doctor_ui.dart";

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
