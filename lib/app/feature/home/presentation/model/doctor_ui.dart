import "package:equatable/equatable.dart";

class DoctorUI extends Equatable {
  DoctorUI({
    required this.kod,
    required this.name,
    required this.filial,
    required this.dolzhnost,
    required this.img,
    required this.active,
    required this.del
  });

  int kod;
  String name;
  String filial;
  String dolzhnost;
  String img;
  String active;
  String del;

  @override
  List<Object?> get props => [kod, name, filial,dolzhnost,img,active,del];

}
