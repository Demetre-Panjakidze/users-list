import 'package:flutter/material.dart';
import 'package:test/data/user_professions.dart';
import 'package:test/models/user_info.dart';
import 'package:test/models/user_profession.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  int age = 0;
  Profession _selectedProfession = professions[Professions.accountant]!;

  void _saveItems() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        UserInfo(
          firstName: firstName,
          lastName: lastName,
          age: age,
          professions: _selectedProfession,
          id: DateTime.now().toString(),
        ),
      );
    }
  }

  void _resetItems() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new user'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text('First name'),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 30) {
                            return 'Must be between 1 and 30 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          firstName = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text('Last Name'),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 30) {
                            return 'Must be between 1 and 30 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          lastName = value!;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Age'),
                        ),
                        initialValue: age.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Must be a valid, positive number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          age = int.tryParse(value!)!;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _selectedProfession,
                        items: [
                          for (final profession in professions.entries)
                            DropdownMenuItem(
                              value: profession.value,
                              child: Text(profession.value.professionName),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedProfession = value!;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _resetItems,
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: _saveItems,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
