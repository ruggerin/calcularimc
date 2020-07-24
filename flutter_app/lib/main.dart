import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcular IMC',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Primeiro Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imcResult = 0;
  String texto = "";
  Color _corTexto = Colors.grey;
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  
  void _calcularImc(){
    setState(() {
      _imcResult = double.parse(pesoController.text) /
          (double.parse(alturaController.text) *
              double.parse(alturaController.text));
      if (_imcResult <= 17){
        texto = "Muito Abaixo do Peso";
        _corTexto = Colors.green;
      }else if(_imcResult > 17  && _imcResult < 18.5){
        texto = "Abaixo do peso";
        _corTexto = Colors.tealAccent;
      }else if(_imcResult >= 18.5  && _imcResult < 25){
        texto = "Peso normal";
        _corTexto = Colors.lightBlue;
      }else if(_imcResult >= 25 && _imcResult < 30){
        texto = "Sobrepeso";
        _corTexto = Colors.orange;
      }
      else if(_imcResult >= 30 && _imcResult < 35){
        texto = "Obesidade I";
        _corTexto = Colors.deepOrange;
      }else if(_imcResult >= 35 && _imcResult < 40){
        texto = "Obesidade II";
        _corTexto = Colors.red;
      }else if(_imcResult >= 40){
        texto = "Obesidade Mórbida";
        _corTexto = Colors.black;
      }
      _imcResult = roundDouble( _imcResult,2);
      FocusScope.of(context).unfocus();
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:
      SingleChildScrollView(
      child:
      Column(
          children: <Widget>[
            Icon(Icons.person_outline,size:120, color: Colors.green),
            
            Padding(
              
              padding: EdgeInsets.all(20),
              child:
              TextField(keyboardType: TextInputType.number,
                  controller: pesoController,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                    ),
                    labelText: 'Peso',
                    prefixIcon: const Icon(Icons.filter_frames, color: Colors.green,),
                    prefixText: ' ',
                    suffixText: 'KG',
                    suffixStyle: const TextStyle(color: Colors.green),

                  ))

            ),

        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child:
            TextField(keyboardType: TextInputType.number,
                controller: alturaController,
                decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),

              labelText: 'Altura',
                 prefixIcon: const Icon(Icons.arrow_upward, color: Colors.green,),
              prefixText: ' ',
                suffixText: 'Metros',
                suffixStyle: const TextStyle(color: Colors.green)
            ))
        ),
        Container(
              width: double.infinity,
              height: 90,
              padding: EdgeInsets.all(20),
                child: RaisedButton(
                color: Colors.green,

                onPressed: _calcularImc,
                child: Text("Calcular", style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child :
              Column(
                children: <Widget> [
                  Text(
                    "Seu IMC está em: $_imcResult",
                  ),
                  Text(
                    texto,
                    style: TextStyle(color: _corTexto , fontSize: 30),
                  ),
                ],
              ),

            )

        ]
      )

    )
    );
  }
}
