import 'package:imc/Person.dart';
import 'package:imc/imc.dart';
import 'package:imc/util/console.dart' as console;

class App {

  Person readPerson(){
     
    final name = console.readLine("Nome: ");
    final height = console.readabsoluteDouble("Altura: ");
    final wheight = console.readabsoluteDouble("Peso: ");

    return Person(name, wheight, height);
  }

  void run(){

      do {
        final person = readPerson();
        final imc = imcPerson(person);
        final imcClass = imcClassification(imc);
        print("Seu IMC é $imc, $imcClass");

      } while(console.readYesOrNot("Continuar? ")); 
  }
}