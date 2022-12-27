import 'package:cadastro_crud/components/user_tile.dart';
import 'package:cadastro_crud/provider/user_provider.dart';
import 'package:cadastro_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late User user;
  @override
  Widget build(BuildContext context) {
    var usuario = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.USER_FORM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: usuario.count,
        itemBuilder: (context, int i) => UserTile(user: usuario.byIndex(i),)
      ),
    );
  }
}
