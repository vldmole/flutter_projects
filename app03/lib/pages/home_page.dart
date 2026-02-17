

import 'package:app03/components/validators/app_bar/menu_builder.dart' as menu_builder;
import 'package:app03/components/validators/app_bar/menu_builder.dart' show TMenuItem;
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
 
  Widget _body = SizedBox(width: double.infinity, height: double.infinity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      drawer: menu_builder.builDrawerMainMenu(_menuItens()),
      body: _body,
    );
  }
  
  List<TMenuItem> _menuItens(){
    
    return [
        ( text: "Dados Pessoais", action: ()=> refreshBody( 
          PersonForm(onSave: (Person person) { dev.log(person.toString()); },)
        )),
      ];
  }

  void refreshBody(Widget body){
    
    setState(() => _body = body);
    Navigator.pop(context); 
  }
}