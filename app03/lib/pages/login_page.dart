
import 'dart:developer' as dev;
import 'package:app03/util/dialogs/list_input_dialog.dart';
import 'package:app03/util/dialogs/input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWidget> {
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body  : _buildBody(context),
    );
  }

  AppBar _buildAppBar (BuildContext context){
    return AppBar(
      title: Text("Autenticação", style: GoogleFonts.pacifico()),
      elevation: 1,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex:4),
              _buildBodyHeader(context),
              Spacer(flex:4),
              _buildEmailTextField(context),
              Spacer(flex:1),
              _buildPasswordTextField(context),
              Spacer(flex: 4),
              _buildLoginButton(context),
              Spacer(flex:5),
              _buildFooter(context),
              Spacer(flex:2),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildBodyHeader(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.account_circle, size: 80, color: Colors.blueAccent),
        const SizedBox(height: 16),
        Text(
          'Olá seja bem vindo!',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTextField (BuildContext context){
    return _buildTextField(
      context: context,
      label: 'Email',
      hint: 'exemplo@email.com',
      icon: Icons.email_outlined,
      controller: _emailController,
    );
  }

  Widget _buildPasswordTextField(BuildContext context){

    return  _buildTextField(
      context: context,
      label: 'Senha',
      hint: 'Digite sua senha',
      icon: Icons.lock_outline,
      controller: _passwordController,
      isPassword: true,
      );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.phone,
      enableSuggestions: false,
      autocorrect: false,     
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => _onSubmitButtonPressed(context),

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'ENTRAR',
          style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _createNewPassword,
          child: Text('Esqueci a senha',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ),
        TextButton(
          onPressed: _signUp,
          child: Text('Criar Conta',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        )
      ]
    );
  }

  void _onSubmitButtonPressed(BuildContext context){
      dev.log(
      'Tentativa de login realizada', 
      name: 'auth.login',
      error: 'Email digitado: ${_emailController.text}',
    );

    _mostrarAlerta(context);
  }  


  Future<void> _createNewPassword() async {

      final String? result = await InputDialog.showInputDialog(
            context,
            "Esqueceu a Senha?",
            "Nova Senha",
            "min 6 caracteres"
          );

    if (result != null && result.isNotEmpty) {
      
      dev.log("O nome digitado foi: $result");
      setState(() {
        // _nome = resultado;
      });
    }
  }

  Future<void> _signUp() async {

    List<FieldConfig> fields = [
      (label:"Email", hint:"email@company.com", obscured:false),
      (label:"Password", hint:'min 6 characters', obscured:true),
    ].cast();
   
    fields.map((field) => dev.log(field.toString()));
    final List<String?>? result = await ListInputDialog.showInputDialog(
      context,
      "Criar conta",
      fields
    );

    if (result != null && result.isNotEmpty) {
      
      dev.log('line 228');
      for (var r in result) {
        dev.log(r.toString());
      }
      setState(() {
        // _nome = resultado;
      });
    }
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sucesso!',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Text('Login efetuado com sucesso. (${_emailController.text})'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o alerta
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  
  @override
  void dispose() {
    _emailController.dispose(); 
    _passwordController.dispose();
    super.dispose(); 
  }
  
  
}

