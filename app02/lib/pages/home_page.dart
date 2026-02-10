import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      textScaler: TextScaler.linear(2),
      style: GoogleFonts.abyssinicaSil(fontSize: 30),
    );
  
  final _appBar =  AppBar(
        title: Text("Generator of Random Integer Numbers", style: GoogleFonts.pacifico()),
        elevation: 1,
      );
 
  final _randomGen = Random();
  int _generatedInt = 0;
  
  Text _randomIntText() {
    return Text(
      _generatedInt.toString(),
      textScaler: TextScaler.linear(5),
      style: GoogleFonts.aladin(),
    );
  }

  Center get _appBody => Center( 
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ _olaText, _randomIntText()]
          )
        )
      );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _appBody,
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
