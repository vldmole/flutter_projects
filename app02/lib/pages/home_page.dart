import 'dart:math';
import 'package:flutter/material.dart';

//stf tab
class MyWidgetHomePage extends StatefulWidget {

  const MyWidgetHomePage({super.key});

  @override
  State<MyWidgetHomePage> createState() {
    return _MyWidgetHomePageState();
  }
}

class _MyWidgetHomePageState extends State<MyWidgetHomePage> {

  final _olaText = Text(
      "Olá", 
      textDirection: TextDirection.rtl, 
      textScaler: TextScaler.linear(2)
    );
  
  final _randomGen = Random();
  int _generatedInt = 0;
  
  Text _randomIntText() {
    return Text(
      _generatedInt.toString(),
      textScaler: TextScaler.linear(5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generator of Random Integer Numbers"),
        elevation: 1,
      ),
      body: Center( 
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center children horizontally
            children: <Widget>[ _olaText, _randomIntText()]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _generatedInt= _randomGen.nextInt(1000);
          });
        }
      ),
    );
  }
}
