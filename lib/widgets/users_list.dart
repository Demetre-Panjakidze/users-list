import 'package:flutter/material.dart';
import 'package:test/data/user_professions.dart';
import 'package:test/models/user_info.dart';
import 'package:test/models/user_profession.dart';
import 'package:test/widgets/new_user.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  String professionsList = '';
  final List<UserInfo> _usersList = [];

  // Widget professionsCreator(Profession list) {
  //   return Text(professionsList.substring(0, professionsList.length - 2));
  // }

  void _addItem() async {
    final newUser = await Navigator.of(context).push<UserInfo>(
      MaterialPageRoute(
        builder: (ctx) => const NewUser(),
      ),
    );

    if (newUser == null) {
      return;
    }

    setState(() {
      _usersList.add(newUser);
    });
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
              subtitle: Text(_usersList[index].professions.professionName),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.supervised_user_circle),
        title: const Text('Users list'),
        actions: [
          IconButton(
            onPressed: () {
              _addItem();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
