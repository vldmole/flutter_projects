

import 'dart:developer' as dev;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef FieldConfig = ({String label, String hint, bool obscured});

class ListInputDialog extends StatefulWidget {
  
  final String title;
  final List<FieldConfig> fields;

  const ListInputDialog({
    super.key, 
    required this.title,
    required this.fields,
  });

  @override
  State<ListInputDialog> createState() => _ListInputDialogState();

 // static int _countKey = 1;

  static Future<String?> showInputDialog(
    BuildContext context, 
    String title, 
    List<FieldConfig> fields
  ) async {
    
    return showDialog<String>(
        context: context,
        builder: (context) => ListInputDialog(
         // key:ValueKey('VarInputDialog_${_countKey++}'), 
          title:title, 
          fields:fields, 
        )
      );
  }
}

class _ListInputDialogState extends State<ListInputDialog> {

  late List<TextEditingController> _controllers;

  @override
  void initState() {
  
    super.initState();
    dev.log('line 51');
    widget.fields.map((field) => dev.log(field.toString()));
    _controllers = widget.fields.map((field) => TextEditingController()).toList();
    dev.log('line 53');
  }

  @override
  Widget build(BuildContext context) {
    dev.log('line 53');
    return AlertDialog(
  
      title: Text(widget.title),
      content: SizedBox(
        width: 250,
        height: (50.0 * widget.fields.length),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: widget.fields.mapIndexed((index, field) => /*Column(
            children:[
              Text(field.label, textScaler: TextScaler.linear(1.5)),*/
              TextField(
                controller: _controllers[index],
                autofocus: true,
                obscureText: field.obscured,
                decoration: InputDecoration(labelText: field.label, hintText: field.hint),
              )).toList()
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Retorna null
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controllers.map((c) => c.text).toList()),
          child: const Text("OK"),
        ),
      ]
    );
  }

  @override
  void dispose() {

    for (var c in _controllers) {
      c.dispose();
    }
    _controllers.clear();
    super.dispose();
  }
}