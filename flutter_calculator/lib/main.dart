import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.white, fontSize: 48, fontFamily: 'QueenFont'),
          bodyText1: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'QueenFont'),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  String? _operator;
  double? _num1;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _currentInput = "";
        _output = "0";
        _operator = null;
        _num1 = null;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        if (_currentInput.isNotEmpty && _num1 == null) {
          _num1 = double.parse(_currentInput);
          _currentInput = "";
          _output = _num1.toString();
        }
        _operator = buttonText;
      } else if (buttonText == "=") {
        if (_currentInput.isNotEmpty && _num1 != null && _operator != null) {
          double num2 = double.parse(_currentInput);
          double result = 0.0;
          switch (_operator) {
            case "+":
              result = _num1! + num2;
              break;
            case "-":
              result = _num1! - num2;
              break;
            case "×":
              result = _num1! * num2;
              break;
            case "÷":
              if (num2 != 0) {
                result = _num1! / num2;
              } else {
                _output = "Error";
                return;
              }
              break;
          }
          _output = result.toStringAsFixed(2);
          _currentInput = "";
          _operator = null;
          _num1 = null;
        }
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

  Widget _buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: 4,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'QueenFont'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Text(
                _output,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Divider(height: 0),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7", 1, Colors.purple),
                  _buildButton("8", 1, Colors.purple),
                  _buildButton("9", 1, Colors.purple),
                  _buildButton("÷", 1, Colors.deepPurple),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", 1, Colors.purple),
                  _buildButton("5", 1, Colors.purple),
                  _buildButton("6", 1, Colors.purple),
                  _buildButton("×", 1, Colors.deepPurple),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", 1, Colors.purple),
                  _buildButton("2", 1, Colors.purple),
                  _buildButton("3", 1, Colors.purple),
                  _buildButton("-", 1, Colors.deepPurple),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", 1, Colors.red),
                  _buildButton("0", 1, Colors.purple),
                  _buildButton("=", 1, Colors.deepPurple),
                  _buildButton("+", 1, Colors.deepPurple),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
