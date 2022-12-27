import 'package:cadastro_crud/pages/user_form.dart';
import 'package:cadastro_crud/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(user.nome),
      subtitle: Text(
        user.email,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.USER_FORM,
                    arguments: user);
              },
              icon: const Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Excluir usuário'),
                          content: const Text('Tem certeza?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .remove(user);
                                Navigator.pop(context);
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
