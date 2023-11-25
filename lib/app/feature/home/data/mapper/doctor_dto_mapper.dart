import "../../domain/model/doctor.dart";
import "../api/model/doctor_dto/doctor_dto.dart";

extension ToDoctor on DoctorDto {
  Doctor toDoctor() {
    return Doctor(
        kod: int.parse(kod),
        name: name,
        filial: filial,
        dolzhnost: dolzhnost,
        img: img,
        active: active,
        del: del
    );
  }
}
