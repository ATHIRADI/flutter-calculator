import 'package:calculator/providers/calculator_provider.dart';
import 'package:calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff050505),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Consumer<CalculatorProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                " =",
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  value.firstNumber.isEmpty
                                      ? "0 "
                                      : "${value.firstNumber} ${value.currentOperator} ${value.secondNumber}",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    gradient: LinearGradient(
                      begin: const Alignment(0, 2),
                      end: const Alignment(2, 0),
                      colors: [
                        const Color(0xFF050505),
                        const Color(0xFF002235).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttons(
                            context: context,
                            buttonText: "AC",
                          ),
                          buttons(
                            context: context,
                            buttonText: "DEL",
                          ),
                          buttons(
                            context: context,
                            buttonText: "%",
                          ),
                          buttons(
                            context: context,
                            buttonText: "/",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttons(
                            context: context,
                            buttonText: "1",
                          ),
                          buttons(
                            context: context,
                            buttonText: "2",
                          ),
                          buttons(
                            context: context,
                            buttonText: "3",
                          ),
                          buttons(
                            context: context,
                            buttonText: "*",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttons(
                            context: context,
                            buttonText: "4",
                          ),
                          buttons(
                            context: context,
                            buttonText: "5",
                          ),
                          buttons(
                            context: context,
                            buttonText: "6",
                          ),
                          buttons(
                            context: context,
                            buttonText: "+",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttons(
                            context: context,
                            buttonText: "7",
                          ),
                          buttons(
                            context: context,
                            buttonText: "8",
                          ),
                          buttons(
                            context: context,
                            buttonText: "9",
                          ),
                          buttons(
                            context: context,
                            buttonText: "-",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttons(
                            context: context,
                            buttonText: ".",
                          ),
                          buttons(
                            context: context,
                            buttonText: "0",
                          ),
                          buttons(
                            context: context,
                            buttonText: "=",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
