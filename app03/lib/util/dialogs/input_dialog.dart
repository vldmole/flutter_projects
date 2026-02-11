

import 'dart:developer' as dev;
import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  
  final String title;
  final String message;
  final String? hint;

  const InputDialog({
    super.key, 
    required this.title,
    required this.message,
    this.hint = "",
  });

  @override
  State<InputDialog> createState() => _InputDialogState();

  static Future<String?> showInputDialog(BuildContext context, String title, String message, String? hint ) async {
    
    return showDialog<String>(
        context: context,
        builder: (context) => InputDialog(title:title, message:message, hint:hint)
      );
  }
}

class _InputDialogState extends State<InputDialog> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dev.log('line 36');
    return AlertDialog(
  
      title: Text(widget.title),
      content: SizedBox(
        width: 250,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(widget.message, textScaler: TextScaler.linear(1.5)),
            TextField(
              controller: _controller,
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(hintText: widget.hint),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Retorna null
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text), // Retorna o texto
          child: const Text("OK"),
        ),
        ]
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Importante para evitar vazamento de memória
    super.dispose();
  }
}