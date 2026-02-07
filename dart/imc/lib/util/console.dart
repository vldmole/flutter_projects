import 'dart:io';

String readLine(String message) {

  stdout.write('\n$message');
  return stdin.readLineSync() ?? '';
}

double readDouble(String message) {

  while(true){
    try {
      stdout.write('\n$message');
      return double.parse(stdin.readLineSync() ?? 'NaN');
    }
    on Exception catch (_, e){
      print("Error: $e");
    }
  }
}

double readabsoluteDouble(String message) {

  return readDouble(message).abs();
}

bool readYesOrNot(String message) {

  stdout.write('\n$message');
  return readChar('SsNn').toUpperCase() == 'S';
}

String readChar(String accept){

  stdout.write('($accept.split('').toString())');
  String resp = '';
  while(resp.length != 1 || !accept.contains(resp)){
    resp = stdin.readLineSync() ?? '';
  }
  return resp;
}