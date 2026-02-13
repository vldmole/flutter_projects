import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatefulWidget {
  
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextStyle textSytle;
  
  const PasswordTextField({
    super.key, 
    required this.controller, 
    this.label = 'Senha',
    this.hint = "min 6 caracteres",
    this.prefixIcon = Icons.lock_outline,
    this.textSytle = const TextStyle(color: Colors.white),
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
  
    return TextField(

      controller: widget.controller,
      obscureText: _isObscured,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.phone,
      enableSuggestions: false,
      autocorrect: false,     
      style: _buildTextStyle(),
      decoration: _buildDecoration(),
    );
  }

  TextStyle _buildTextStyle(){
    return TextStyle(
      color: Colors.blueAccent,
      fontWeight: FontWeight.w600, 
      fontSize: 16,
      fontFamily: "Arial"
    );
  }

  InputDecoration _buildDecoration(){
    
    return InputDecoration(

        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.blueAccent, fontFamily: "Arial", fontSize: 26),
        floatingLabelBehavior: FloatingLabelBehavior.always, 

        hintText: widget.hint,
        
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(top: 20, bottom: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: Listener(
          onPointerDown: (_) {
            setState(() => _isObscured = false);
          },
          onPointerUp: (_) {
            setState(() => _isObscured = true);
          },
          child: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      );
  }
}

  
  