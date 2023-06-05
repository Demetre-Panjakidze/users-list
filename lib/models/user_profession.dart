import 'package:flutter/material.dart';

enum Proffesions {
  doctor,
  engineer,
  teacher,
  artist,
  lawyer,
  chef,
  writer,
  pilot,
  architect,
  musician,
  designer,
  athlete,
  scientist,
  photographer,
  accountant,
  programmer,
  policeman,
  firefighter,
  dentist,
  nurse,
}

class Proffesion {
  const Proffesion(
    this.proffesionName,
    this.color,
  );

  final String proffesionName;
  final Color color;
}
