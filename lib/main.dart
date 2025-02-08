import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String inputdata = "0";
  String displayData = "0";
  double previousValue = 0;
  String operator = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                displayData,
                style: const TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  buildButtonRow(["C", "±", "%", "⌫"], [Colors.red, Colors.grey, Colors.grey, Colors.grey]),
                  buildButtonRow(["7", "8", "9", "/"], [Colors.grey, Colors.grey, Colors.grey, Colors.orange]),
                  buildButtonRow(["4", "5", "6", "*"], [Colors.grey, Colors.grey, Colors.grey, Colors.orange]),
                  buildButtonRow(["1", "2", "3", "-"], [Colors.grey, Colors.grey, Colors.grey, Colors.orange]),
                  buildButtonRow(["0", ".", "=", "+"], [Colors.grey, Colors.grey, Colors.orange, Colors.orange]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> texts, List<Color> colors) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(texts.length, (index) {
          return buildButton(texts[index], colors[index]);
        }),
      ),
    );
  }

  Widget buildButton(String text, Color bgcolor) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            setState(() {
              if (text == "C") {
                inputdata = "0";
                displayData = "0";
                previousValue = 0;
                operator = "";
              } else if (text == "⌫") {
                inputdata = inputdata.length > 1
                    ? inputdata.substring(0, inputdata.length - 1)
                    : "0";
                displayData = inputdata;
              } else if (text == "±") {
                inputdata = (double.parse(inputdata) * -1).toString();
                displayData = inputdata;
              } else if (text == "%") {
                inputdata = (double.parse(inputdata) / 100).toString();
                displayData = inputdata;
              } else if (text == "+" || text == "-" || text == "*" || text == "/") {
                previousValue = double.parse(inputdata);
                operator = text;
                inputdata = "0";
                displayData = previousValue.toString() + operator;
              } else if (text == "=") {
                double currentValue = double.parse(inputdata);
                switch (operator) {
                  case "+":
                    inputdata = (previousValue + currentValue).toString();
                    break;
                  case "-":
                    inputdata = (previousValue - currentValue).toString();
                    break;
                  case "*":
                    inputdata = (previousValue * currentValue).toString();
                    break;
                  case "/":
                    if (currentValue != 0) {
                      inputdata = (previousValue / currentValue).toString();
                    } else {
                      inputdata = "Error";
                    }
                    break;
                  default:
                    inputdata = currentValue.toString();
                }
                displayData = inputdata;
                operator = "";
              } else {
                if (inputdata == "0" && text != ".") {
                  inputdata = text;
                } else if (text == "." && !inputdata.contains(".")) {
                  inputdata += text;
                } else {
                  inputdata += text;
                }
                displayData = previousValue.toString() + operator + inputdata;
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
