import 'package:flutter/material.dart';
import 'package:test/widgets/users_list.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: const UsersList(),
    ),
  );
}
