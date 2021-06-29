import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      /* Chamamos a função runApp, e dentro passamos um widget, 
     esse widget é o MaterialApp. */
      title: "Contador de pessoas",
      //Passamos os parametros no construtores, passamos o parametro title,
      //um valor interno.
      // home: Container(color: Colors.white),
      //Passamos o home, que será a nossa tela.
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!!!";

  void ChangePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "O Restaurante Fechou";
      } else if (_people <= 11) {
        _infoText = "Pode Entrar!!!!";
      } else {
        _infoText = "Está Lotado!!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Image.asset(
          "images/eu.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Comando para alinhar a Coluna no centro.

          children: <Widget>[
            //Filho "child" Texto.

            Text(
              "Pessoas: $_people ",
              style: TextStyle(
                color: Colors.black,
                //Comando para definir uma cor ao text.

                fontWeight: FontWeight.bold,
                //Comando para o definir o estilo das letras.
                fontSize: 50.0,
              ),
            ),

            Row(
              //Filho da Coluna, uma linha "Row".
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //Nada mais é do que os espaços nas laterias entra um widget
                  // e outro.
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    //Filho da linha, um FlatButton.
                    child: Text(
                      //Filho do FlatButton, um Text.
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      ChangePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    //Filho da linha, um FlatButton.
                    child: Text(
                      //Filho do FlatButton, um Text.
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      ChangePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              //Filho da Coluna, um Text.
              _infoText,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
