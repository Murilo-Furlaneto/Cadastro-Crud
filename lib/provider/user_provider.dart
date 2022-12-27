import 'dart:math';

import 'package:flutter/material.dart';

import '../model/user.dart';
import '../repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  var user = User_Data;

  int get count {
    return user.length;
  }

  User byIndex(int i) {
    return user.values.elementAt(i);
  }

  void put(User usuario) {
    if (usuario == null) {
      return;
    }
    //
    if (usuario.id.trim().isNotEmpty && user.containsKey(usuario.id)) {
      user.update(
          usuario.id,
          (_) =>
              User(id: usuario.id, nome: usuario.nome, email: usuario.email));
    }
    //
    else {
      final id = Random().nextDouble().toString();

      user.putIfAbsent(
          id, () => User(id: id, nome: usuario.nome, email: usuario.email));
    }
    notifyListeners();
  }

  void remove(User usuario) {
    user.remove(usuario.id);
    notifyListeners();
  }
}
