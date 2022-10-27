import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, bottom: 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Text(
                output,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 30, left: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        buidlButton('7', Colors.blue),
                        buidlButton('8', Colors.blue),
                        buidlButton('9', Colors.blue),
                        buidlButton('X', Colors.amber),
                      ],
                    ),
                    Row(
                      children: [
                        buidlButton('4', Colors.blue),
                        buidlButton('5', Colors.blue),
                        buidlButton('6', Colors.blue),
                        buidlButton('-', Colors.amber),
                      ],
                    ),
                    Row(
                      children: [
                        buidlButton('1', Colors.blue),
                        buidlButton('2', Colors.blue),
                        buidlButton('3', Colors.blue),
                        buidlButton('+', Colors.amber),
                      ],
                    ),
                    Row(
                      children: [
                        buidlButton('C', Colors.red),
                        buidlButton('0', Colors.blue),
                        buidlButton('.', Colors.blue),
                        buidlButton('=', Colors.amber),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buidlButton(String buttonId, Color buttonColor) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => buttonPressed(buttonId),
        child: Container(
          width: 85,
          height: 80,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              buttonId,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
