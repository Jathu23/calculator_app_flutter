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
              alignment: Alignment.topLeft,
              child: Text(
                inputdata.toString(),
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Row(
              children: [
                calbutton("7", Colors.grey),
                calbutton("8", Colors.grey),
                calbutton("9", Colors.grey),
                calbutton("/", Colors.orange),
              ],
            ),
            Row(
              children: [
                calbutton("4", Colors.grey),
                calbutton("5", Colors.grey),
                calbutton("6", Colors.grey),
                calbutton("*", Colors.orange),
              ],
            ),
            Row(
              children: [
                calbutton("1", Colors.grey),
                calbutton("2", Colors.grey),
                calbutton("3", Colors.grey),
                calbutton("-", Colors.orange),
              ],
            ),
            Row(
              children: [
                calbutton("0", Colors.grey),
                calbutton(".", Colors.grey),
                calbutton("=", Colors.orange),
                calbutton("+", Colors.orange),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget calbutton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text == "+" || text == "-" || text == "*" || text == "/") {
           
            previousValue = double.parse(inputdata);
            operator = text;
            inputdata = "0"; 
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
          } else {
            
            if (inputdata == "0" && text != ".") {
              inputdata = text; 
            } else if (text == "." && !inputdata.contains(".")) {
              inputdata += text;
            } else {
              inputdata += text; 
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        height: 80,
        width: 80,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
