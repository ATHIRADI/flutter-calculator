import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String firstNumber = "";
  String secondNumber = "";
  String currentOperator = "";
  String oldNumber = "";

  btnClick(value) {
    if (value == "AC") {
      clearAll();
      return;
    } else if (value == "DEL") {
      deleteDigit();
      return;
    } else if (value == "=") {
      calculateValue();
      return;
    }
    appentValue(value);
    // print(value is int);
    notifyListeners();
  }

  void calculateValue() {
    if (firstNumber.isEmpty) return;
    if (currentOperator.isEmpty) return;
    if (secondNumber.isEmpty) return;

    final double num1 = double.parse(firstNumber);
    final double num2 = double.parse(secondNumber);
    double res = 0.0;

    switch (currentOperator) {
      case ("+"):
        res = num1 + num2;
        break;
      case ("-"):
        res = num1 - num2;
        break;
      case ("*"):
        res = num1 * num2;
        break;
      case ("/"):
        res = num1 / num2;
        break;
      default:
    }

    firstNumber = res.toString();
    currentOperator = "";
    secondNumber = "";

    notifyListeners();
  }

  void appentValue(value) {
    if (value != "." && int.tryParse(value) == null) {
      if (currentOperator.isNotEmpty && secondNumber.isNotEmpty) {
        calculateValue();
      }
      currentOperator = value;
    } else if (firstNumber.isEmpty || currentOperator.isEmpty) {
      if (value == "." && firstNumber.contains(".")) return;
      if (value == "." && (firstNumber.isEmpty || firstNumber == "0")) {
        value = "0.";
      }
      firstNumber += value;

      print(firstNumber);
    } else if (secondNumber.isEmpty || currentOperator.isNotEmpty) {
      if (value == "." && secondNumber.contains(".")) return;
      if (value == "." && (secondNumber.isEmpty || secondNumber == "0")) {
        value = ".";
      }
      secondNumber += value;
    }

    notifyListeners();
  }

  deleteDigit() {
    if (secondNumber.isNotEmpty) {
      secondNumber = secondNumber.substring(0, secondNumber.length - 1);
    } else if (currentOperator.isNotEmpty) {
      currentOperator =
          currentOperator.substring(0, currentOperator.length - 1);
    } else if (firstNumber.isNotEmpty) {
      firstNumber = firstNumber.substring(0, firstNumber.length - 1);
    }
    notifyListeners();
  }

  clearAll() {
    firstNumber = "";
    secondNumber = "";
    currentOperator = "";
    notifyListeners();
  }
}
