import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemHome {
  final String? title;
  final Icon? icon;
  const MenuItemHome({this.title, this.icon});
}

class Menu {
  static const soldItem =
      MenuItemHome(title: 'Vendu', icon: Icon(Icons.verified_outlined));
  static const waitingItem =
      MenuItemHome(title: 'En attente', icon: Icon(Icons.access_time_outlined));
  static const editItem =
      MenuItemHome(title: 'Modifier', icon: Icon(Icons.edit_outlined));
  static const deleteItem =
      MenuItemHome(title: 'Supprimer', icon: Icon(Icons.delete_outline));
  static const List<MenuItemHome> items = [
    soldItem,
    waitingItem,
    editItem,
    deleteItem,
  ];
}
