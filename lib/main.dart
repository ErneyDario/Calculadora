
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculadora',
      theme: ThemeData(
       
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'calculadora-Mintic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "USD";
String op2 ="COP";

List<DropdownMenuItem<String>> listmoneda = <DropdownMenuItem<String>>[
DropdownMenuItem(value: 'USD', child: Text('USD')),
DropdownMenuItem(value: 'USD', child: Text('EUR')),
DropdownMenuItem(value: 'USD', child: Text('COP')),

];



List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("8", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("7", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("6", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("5", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("4", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("3", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("2", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("1", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("0", Colors.lightGreen,Icon(Icons.abc_sharp)),
  calculadora("limpiar", Colors.lightGreen,Icon(Icons.cleaning_services)),
  calculadora("=", Colors.lightGreen,Icon(Icons.abc_sharp)),

];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child:Column(
          children: [
            Row(
              children: [
                Text('Moneda Origen : '),
                DropdownButton(items: listmoneda, onChanged:(String? x) {}),
                Text('moneda destino : '),
                 DropdownButton(items: listmoneda, onChanged:(String? x) {}),
              ],
            ),
            TextField(
              controller: textOrigen,
              decoration: InputDecoration(labelText:"Origen", hintText: "0", icon: Icon(Icons.monetization_on)),),
            TextField(
              controller: textDestino,
              decoration: InputDecoration(labelText:"destino", hintText: "0", icon: Icon(Icons.monetization_on)),),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                   color: cal[index].color,
                   child:ListTile(

                    title: Center(
                      child: index == 10
                        ? cal[index].icono
                        : Text(
                            cal[index].titulo,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 35)
                        )
                    ),
                      onTap: () {
                        if (index <10){
                        textOrigen.text = textOrigen.text + cal[index].titulo;
                        } else if (index == 10 ) {
                          //textOrigen.clear(); //Op 1
                          textOrigen.text = ""; 
                          textDestino.text = "";//Op 2 
                        } else {
                          if ( op1 =='USD'&& op2 == 'COP'){
                            textDestino.text= 
                            (double.parse(textOrigen.text)*5100).toString();
                          }
                        }
                        print(cal[index].titulo);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}