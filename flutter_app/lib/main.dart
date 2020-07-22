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
        primarySwatch: Colors.blue,
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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  void _calcularImc(){
    setState(() {
      _imcResult =double.parse(pesoController.text)/( double.parse(alturaController.text)*double.parse(alturaController.text));
    
    });


  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
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
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "IMC: $_imcResult",
              ),
            )

        ]
      )

    );
  }
}
