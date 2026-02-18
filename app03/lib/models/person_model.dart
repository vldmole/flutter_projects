import 'package:intl/intl.dart';

class Person {

  String firstName;
  String lastName;
  DateTime birthDate;
  String sex;
  String professionalLevel;

  Person({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.sex, 
    required this.professionalLevel,
  });

  @override
  String toString() => ('''
    Person( name: $firstName $lastName,
            birth date: ${DateFormat('dd/MM/yyyy').format(birthDate)},
            sex: $sex,
            level:$professionalLevel)'''
  );
}