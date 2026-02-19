

import 'package:app03/components/drawer/drawer_builder.dart';
import 'package:app03/components/drawer/main_drawer.dart';
import 'package:app03/models/person_model.dart';
import 'package:app03/pages/user/person_data_form.dart';
import 'package:flutter/material.dart';

import 'dart:developer' as dev;

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      drawer: MainMenuDrawer(pageController: _pageController),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(), 
      onPageChanged: (index) => dev.log("page $index"),
      children: [
        PersonForm(onSave: (p) => dev.log(p.toString())),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Sempre descarte controllers para evitar vazamento de memória
    super.dispose();
  }
}