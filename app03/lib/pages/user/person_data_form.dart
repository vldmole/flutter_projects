import 'package:app03/components/password/professional_level/professional_level.dart';
import 'package:app03/models/person_model.dart';
import 'package:app03/repositories/professional_level_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app03/components/util/responsive_layout.dart' show responsiveLayout;

class PersonForm extends StatefulWidget {
  
  final Function(Person) onSave;

  const PersonForm({
    super.key,  
    required this.onSave,
  });

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {

  final _formKey = GlobalKey<FormState>();
  
  String firstName ='';
  String lastName ='';
  DateTime birthDate = DateTime.now();
  String sex = 'Masculino';
  String professionalLevel = "";
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: SingleChildScrollView( // Garante que o teclado não cubra os campos
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              responsiveLayout.buildRowColumn(
                context,
                _buildFirstNameField(),
                _buildLastNameField(),
              ),
              const SizedBox(height: 10),
              responsiveLayout.buildRowColumn(
                context, 
                _buildBirthDateField(),
                _buildSexField()
              ),
              ProfessionalLevel( 
                repository: ProfessionalLevelRepository(),
                onChanged: (value) => professionalLevel = value
              ),
              const SizedBox(height: 30),
              _buildButtonSave(),
            ],
          )
        ),
      )
    );
  }

  Widget _buildFirstNameField(){
    return TextFormField(
      enabled: true,
      readOnly: false,
      decoration: const InputDecoration(labelText: 'Nome'),
      validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
      onSaved: (v) => firstName = v!,
    );
  }

  Widget _buildLastNameField(){
    return TextFormField(
      enabled: true,
      readOnly: false,
      decoration: const InputDecoration(labelText: 'Sobrenome'),
      validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
      onSaved: (v) => lastName = v!,
    );
  }

  final _dateController = TextEditingController();
  
  Widget _buildBirthDateField(){
    return TextFormField(
      controller: _dateController,
      decoration: const InputDecoration(
        labelText: 'Data de Nascimento',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () => _showDatePicker(context),
      validator: (v) => v!.isEmpty ? 'Selecione uma data' : null,
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    
    if (selectedDate != null) {
      setState(() {
        birthDate = selectedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  Widget _buildSexField(){

    return DropdownButtonFormField<String>(
      initialValue: sex,
      decoration: const InputDecoration(labelText: 'Sexo'),
      items: ['Masculino', 'Feminino', 'Outro']
          .map((label) => DropdownMenuItem(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (v) => setState(() => sex = v!),
    );
  }

  Widget _buildButtonSave(){
    
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          widget.onSave(Person(
            firstName: firstName, 
            lastName: lastName, 
            birthDate: birthDate, 
            sex: sex,
            professionalLevel: professionalLevel));
        }
      },
      child: const Text('SALVAR DADOS'),
    );
  }

}