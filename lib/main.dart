import 'package:cadastro_crud/pages/user_form.dart';
import 'package:cadastro_crud/pages/user_list.dart';
import 'package:cadastro_crud/provider/user_provider.dart';
import 'package:cadastro_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cadastro Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (_) => const UserList(),
        AppRoutes.USER_FORM: (_) => UserForm(),
      },
    );
  }
}
