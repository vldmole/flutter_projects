import 'package:flutter/material.dart';

class PersonFormWidget extends StatefulWidget {
  const PersonFormWidget({super.key});

  @override
  State<PersonFormWidget> createState() => _PersonFormWidgetState();
}

class _PersonFormWidgetState extends State<PersonFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dados Pessoais")),
      //drawer: menu_builder.builDrawerMainMenu(),
    );
  }
}