import 'package:flutter/material.dart';

typedef TMenuItem = ({String text, VoidCallback action});

Widget? builDrawerMainMenu(List<TMenuItem> menuItens) {

    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _generateMenuButtons(menuItens)
        ),
      ),
    );
  }

List<Widget> _generateMenuButtons(List<TMenuItem> itens) {

  return itens.map((item) => TextButton(
    onPressed: item.action, 
    child: Text(item.text)
  )).toList();
}