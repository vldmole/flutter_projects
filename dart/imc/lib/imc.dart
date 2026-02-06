
// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:imc/Person.dart';

double imcPerson(Person person) {
  return imc(person.getWeight(), person.getHeight());
}

double imc( double weight, double height){
  return (weight/ pow(height, 2));
}

String imcClassification(double imc){

  if(imc < 16)
    return 'Magreza extrema';
  if(imc < 17)
    return 'Magreza moderada';
  if(imc < 18.5)
    return 'Magreza Leve';
  if(imc < 25)
    return 'Saudável';
  if(imc < 30)
    return 'Sobrepeso';
  if(imc < 35)
    return 'Obesidade grau 1';
  if(imc < 40)
    return 'Obesidade grau 2 (Severa)';
  
  return 'Obseidade grau 3 (MÓRBIDA)'; 
}
