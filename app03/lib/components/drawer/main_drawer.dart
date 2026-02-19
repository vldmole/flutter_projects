import 'package:app03/components/drawer/drawer_builder.dart';
import 'package:flutter/material.dart';

class MainMenuDrawer extends StatelessWidget {
  
  final PageController pageController;
  
  MainMenuDrawer({
    super.key,
    required this.pageController, 
  });

  @override
  Widget build(BuildContext context) {
    return DrawerBuilder(context, pageController)
      .header("Menu Principal")
      .addItems(_menuItems)
      .build();
  }

  final List<TMenuItem> _menuItems = [
    (text: "Dados Pessoais", icon: Icons.person),
    (text: "Endereço", icon: Icons.access_time_filled),
  ];
}