import 'package:app03/components/validators/required_validator.dart';
import 'package:app03/components/validators/validation_rule_combiner.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextStyle textSytle;
  
  const PasswordFormField({
    super.key, 
    required this.controller, 
    this.label = 'Senha',
    this.hint = "min 6 caracteres",
    this.prefixIcon = Icons.lock_outline,
    this.textSytle = const TextStyle(color: Colors.white),
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
  
    return TextFormField(
      //key: widget.key,
      controller: widget.controller,
      obscureText: _isObscured,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.phone,
      enableSuggestions: false,
      autocorrect: false,     
      style: _buildTextStyle(),
      decoration: _buildDecoration(),
      validator: _buildValidator(),
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

   String? Function(String? value) _buildValidator(){
    
    return ValidationRuleCombiner(validators: [
      RequiredValidationRule(),
    ]).validate;
  }
}
  