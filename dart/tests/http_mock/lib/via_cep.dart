import 'dart:convert';

import 'package:http/http.dart' as http;

Uri _uriCepQuery(String cep){

  return Uri.parse('https://viacep.com.br/ws/$cep/json/');
}

Future<Map<dynamic, dynamic>> getAddress(String cep) async {

  final response = await http.get(_uriCepQuery(cep));
  final decodedBody = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedBody; 
}