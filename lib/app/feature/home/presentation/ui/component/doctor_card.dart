import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import '../../../../shared/presentation/model/doctor_ui.dart';

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
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 80.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? Theme.of(context).primaryColor : Colors.transparent),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x63D6DBE1),
                blurRadius: 40,
              ),
            ],
            color: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      backgroundImage: NetworkImage(doctor.img),
                    )),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(doctor.name, style: Theme.of(context).textTheme.labelLarge),
                    Text(doctor.dolzhnost, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
