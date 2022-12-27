import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/user_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    Key? key,
  }) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
    _formData['nome'] = user.nome;
    _formData['email'] = user.email;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User?  user = ModalRoute.of(context)!.settings.arguments as User?;
    if (user !=null) {
      _loadFormData(user);
    }
  }

  @override
  Widget build(BuildContext context) {
      

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuário'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();

                  Provider.of<UserProvider>(context, listen: false).put(User(
                      id: _formData['id'] ?? Random().nextDouble().toString(),
                      nome: _formData['nome'].toString(),
                      email: _formData['email'].toString()));
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['nome'],
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) => _formData['nome'] = newValue!,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Nome inválido';
                    }
                    if (value.trim().length < 4) {
                      return 'Nome precisa conter mais de 4 letras';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => _formData['email'] = newValue!,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Email inválido';
                    }

                    if (value.length < 6) {
                      return 'Email precisa conter mais de 6 letras';
                    }

                    return null;
                  },
                ),
              ],
            )),
      ),
    );
  }
}
