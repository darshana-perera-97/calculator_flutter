import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double exuationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        exuationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "del") {
        exuationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        exuationFontSize = 38.0;
        resultFontSize = 48.0;
      } else {
        exuationFontSize = 48.0;
        resultFontSize = 38.0;
        if (buttonText == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Table(
        children: [
          TableRow(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
              color: buttonColor,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid)),
                onPressed: () => buttonPressed(buttonText),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Text(
              "Flutter Simple Calculator",
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: exuationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.redAccent),
                      buildButton("del", 1, Colors.black45),
                      buildButton("/", 1, Colors.green),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.blue),
                      buildButton("8", 1, Colors.blue),
                      buildButton("9", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.blue),
                      buildButton("5", 1, Colors.blue),
                      buildButton("6", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.blue),
                      buildButton("2", 1, Colors.blue),
                      buildButton("3", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.blue),
                      buildButton("0", 1, Colors.blue),
                      buildButton("00", 1, Colors.blue),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("x", 1, Colors.green),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.green),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.green),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
