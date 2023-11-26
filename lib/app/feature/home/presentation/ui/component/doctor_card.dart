import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../model/doctor_ui.dart";

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {required this.doctor,
      required this.selectDoctor,
      required this.isSelected,
      super.key});

  final DoctorUI doctor;
  final bool isSelected;
  final void Function() selectDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDoctor,
      child: Container(
        decoration: BoxDecoration(
          border:  Border.all(color: isSelected ? Colors.blueAccent : Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(doctor.img),
                  )),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text(doctor.name), Text(doctor.dolzhnost)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
