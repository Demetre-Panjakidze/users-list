import 'package:flutter/material.dart';

enum Professions {
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

class Profession {
  const Profession(
    this.professionName,
    this.color,
  );

  final String professionName;
  final Color color;
}
