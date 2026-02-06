import 'package:imc/util/console.dart' as console;

import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

class MockStdin extends Mock implements Stdin {}
class MockStdout extends Mock implements Stdout {}

void main(){


  test('Should read only accepted characters', (){

    final mockStdin = MockStdin();
    final mockStdout = MockStdout();
        
    IOOverrides.runZoned(() {

      String accept = 'SsNn';
      String notAccept = 'KjweqpXDAVZ';
      final values = [...accept.split(''), ... notAccept.split('')] ;
      
      final random = Random();
      when(() => mockStdin.readLineSync()).thenAnswer((_){
          return values[random.nextInt(values.length)];
      });

      for(int i=0; i<10; i++) {
        String obtained = console.readChar(accept);
        expect(accept.contains(obtained), true);
      }
    }, 
      stdin: () => mockStdin, 
      stdout: () => mockStdout
    );
  });
}