import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../model/doctor_ui.dart";

class DoctorCard extends StatelessWidget {
  const DoctorCard({required this.doctor, super.key});

  final DoctorUI doctor;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(radius: 25, backgroundImage: NetworkImage(
                      doctor.img),
                  )),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(doctor.name),
                    Text(doctor.dolzhnost)
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }


}
