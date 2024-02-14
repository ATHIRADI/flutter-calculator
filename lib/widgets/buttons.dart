import 'package:calculator/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buttons({buttonText, context}) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  return SizedBox(
    width: buttonText == "=" ? 175 : 80,
    height: 80,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonText == "=" ||
                buttonText == "AC" ||
                buttonText == "DEL" ||
                buttonText == "DEL" ||
                buttonText == "%" ||
                buttonText == "/" ||
                buttonText == "*" ||
                buttonText == "+" ||
                buttonText == "-" ||
                buttonText == "."
            ? Colors.indigo
            : Colors.amber,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: () {
        calculatorProvider.btnClick(buttonText);
      },
      child: Text(
        style: TextStyle(
            color: buttonText == "=" ||
                    buttonText == "AC" ||
                    buttonText == "DEL" ||
                    buttonText == "DEL" ||
                    buttonText == "%" ||
                    buttonText == "/" ||
                    buttonText == "*" ||
                    buttonText == "+" ||
                    buttonText == "-" ||
                    buttonText == "."
                ? Colors.white
                : Colors.black,
            fontSize: buttonText is String ? 18 : 25,
            fontWeight: FontWeight.bold),
        buttonText.toString(),
      ),
    ),
  );
}
