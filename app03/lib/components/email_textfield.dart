import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {

  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;

  const EmailTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.phone,
      enableSuggestions: false,
      autocorrect: false,  

      decoration: _buildDecoration(),
    );
  }

  InputDecoration _buildDecoration(){
    
    return InputDecoration(

        labelText: widget.label,
        hintText: widget.hint,
        
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

        prefixIcon: Icon(widget.prefixIcon)
    );
  }
}