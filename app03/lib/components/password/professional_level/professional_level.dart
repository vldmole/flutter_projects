import 'package:app03/repositories/professional_level_repository.dart';
import 'package:flutter/material.dart';

class ProfessionalLevel extends StatefulWidget {
  
  final ProfessionalLevelRepository repository;
  final void Function(String) onChanged;

  const ProfessionalLevel({
    super.key,
    required this.repository,
    required this.onChanged
  });

  @override
  State<ProfessionalLevel> createState() => _ProfessionalLevelState();
}

class _ProfessionalLevelState extends State<ProfessionalLevel> {

  var levels = [];
  late var _selected = levels[0];

  @override
  void initState(){
    super.initState();
    levels =  widget.repository.all;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        const Text("Experiência"),
        Column(
          children: levels
            .map((level) => RadioMenuButton<String>(
              value: level,
              groupValue: _selected,
              onChanged: (value){
                setState(()=>_selected = value);
                widget.onChanged(value!);
              },
              child: Text(level)
            )).toList()
        )
      ]
    );
  }
}