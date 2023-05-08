import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  late User user;

  UserInfoPage(this.user);

  @override
  Widget build(BuildContext context) {
    print(user.name);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User info',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                user.name,
              ),
              subtitle: Text(user.story ?? ''),
              leading: const Icon(Icons.person),
              trailing: Text(user.country ?? ''),
            ),
            ListTile(
              title: const Text('Phone'),
              subtitle: Text(user.phone),
              leading: const Icon(Icons.phone),
            ),
            if (user.email != null && user.email != '')
              ListTile(
                title: const Text('Email'),
                subtitle: Text(user.email!),
                leading: const Icon(Icons.email),
              )
          ],
        ),
      ),
    );
  }
}
