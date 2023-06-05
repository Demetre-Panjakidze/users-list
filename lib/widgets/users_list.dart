import 'package:flutter/material.dart';
import 'package:test/data/user_professions.dart';
import 'package:test/models/user_info.dart';
import 'package:test/models/user_profession.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  String professionsList = '';
  final List<UserInfo> _usersList = [
    UserInfo(
      id: DateTime.now().toString(),
      firstName: 'Demetre',
      lastName: 'Panjakidze',
      age: 19,
      professions: [
        professions[Proffesions.programmer]!,
        professions[Proffesions.engineer]!,
        professions[Proffesions.musician]!,
      ],
    ),
    UserInfo(
      id: DateTime.now().toString(),
      firstName: 'Elene',
      lastName: 'Atcharadze',
      age: 20,
      professions: [
        professions[Proffesions.programmer]!,
        professions[Proffesions.engineer]!,
        professions[Proffesions.designer]!,
      ],
    ),
  ];

  Widget professionsCreator(List<Proffesion> list) {
    professionsList = '';
    for (final pr in list) {
      professionsList += '${pr.proffesionName}, ';
    }
    return Text(professionsList.substring(0, professionsList.length - 2));
  }

  void _removeItem(UserInfo user) {
    setState(() {
      _usersList.remove(user);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content:
            Text('${user.firstName} ${user.lastName} was removed from list'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No users added'),
    );

    if (_usersList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _usersList.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(_usersList[index].id),
            onDismissed: (_) {
              _removeItem(_usersList[index]);
            },
            child: ListTile(
              leading: const SizedBox(
                height: double.infinity,
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              title: Text(
                  '${_usersList[index].firstName} ${_usersList[index].lastName} (${_usersList[index].age})'),
              subtitle: Row(
                children: [
                  professionsCreator(_usersList[index].professions),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.supervised_user_circle),
        title: const Text('Users list'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
