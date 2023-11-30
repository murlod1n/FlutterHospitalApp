class DoctorEntity {
  DoctorEntity({
    required this.id,
    required this.kod,
    required this.name,
    required this.filial,
    required this.dolzhnost,
    required this.img,
    required this.active,
    required this.del
  });

  final int id;
  final int kod;
  final String name;
  final String filial;
  final String dolzhnost;
  final String img;
  final String active;
  final String del;

}
