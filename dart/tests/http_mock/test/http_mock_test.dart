
import 'dart:math';

import 'package:http_mock/via_cep.dart' as via_cep;
import 'package:nock/nock.dart';
import 'package:test/test.dart';

void main() {

  setUpAll(() {
    nock.init(); 
  });

  setUp(() {
    nock.cleanAll();
  });

  tearDown(nock.cleanAll);

  test('getAddress', () async {
    
    final interceptor = nock("https://viacep.com.br").get("/ws/01001000/json/");
    interceptor
        .reply(200, {
          "logradouro": "Praça da Sé",
          "bairro": "Sé",
          "localidade": "São Paulo"
        });

    final result = await via_cep.getAddress('01001000');

    expect(result['logradouro'], equals('Praça da Sé'));
    expect(result["bairro"], equals('Sé'));
    expect(result["localidade"], equals('São Paulo'));
    expect(interceptor.isDone, isTrue);
  });
}
