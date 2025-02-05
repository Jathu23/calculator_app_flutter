import 'package:flutter/material.dart';

void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
           Row(
                children: [
                       calbutton("7", Colors.grey),
                       calbutton("8", Colors.grey),
                       calbutton("9", Colors.grey),
                       calbutton("/", Colors.grey),
                ],
           ),
              Row(
                children: [
                       calbutton("4", Colors.grey),
                       calbutton("5", Colors.grey),
                       calbutton("6", Colors.grey),
                       calbutton("*", Colors.grey),
                ],
           ),
              Row(
                children: [
                       calbutton("1", Colors.grey),
                       calbutton("2", Colors.grey),
                       calbutton("3", Colors.grey),
                       calbutton("-", Colors.grey),
                ],
           ),
              Row(
                children: [
                       calbutton("0", Colors.grey),
                       calbutton(".", Colors.grey),
                       calbutton("=", Colors.grey),
                       calbutton("+", Colors.grey),
                ],
           )
                
          ],
        ),
      ),
    );
  }

  Widget calbutton(String text, Color bgcolor) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 40,
      width: 40,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white54, fontSize: 10),
      ),
    );
  }
}
