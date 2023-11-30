import "package:equatable/equatable.dart";

class DoctorUI extends Equatable {
  const DoctorUI({
    required this.kod,
    required this.name,
    required this.filial,
    required this.dolzhnost,
    required this.img,
    required this.active,
    required this.del
  });

  final int kod;
  final String name;
  final String filial;
  final String dolzhnost;
  final String img;
  final String active;
  final String del;

  @override
  List<Object?> get props => <Object?>[kod, name, filial,dolzhnost,img,active,del];

}
