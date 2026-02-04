
import 'dart:io';

class Calculator {

  void run(){

    print("Calculator");

    stdout.write("a: ");
    double a = double.parse(stdin.readLineSync() ?? '0');

    stdout.write("b: ");
    double b = double.parse(stdin.readLineSync() ?? '0');

    stdout.write("(+ - * /): ");
    String op = stdin.readLineSync() ?? '+';

    double result = _calculate(a, b, op);
    print("$a $op $b = $result");
  }

  double _calculate(double a, double b, String op){

    switch(op){
      case '+' : return a + b;
      case '-' : return a - b;
      case '*' : return a * b;
      case '/' : return a / b;
      default: return double.nan;
    }
  }
}
