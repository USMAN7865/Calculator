// ignore_for_file: prefer_const_constructors

import 'package:calculator/Screens/buttons.dart';

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userquestion = '';
  var useranswer = '';

  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        // ignore: prefer_const_literals_to_create_immutables
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        userquestion,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    useranswer,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //First Button index 0
                    if (index == 0) {
                      return Buttons(
                        ontapped: () {
                          setState(() {
                            useranswer = '';
                            userquestion = '';
                          });
                        },
                        buttoncolor: Colors.red,
                        buttontext: buttons[index],
                        textcolor: Colors.white,
                      );
                    }

                    //Second Button index 1

                    else if (index == 1) {
                      return Buttons(
                        ontapped: () {
                          setState(() {
                            userquestion = userquestion.substring(
                                0, userquestion.length - 1);
                          });
                        },
                        buttoncolor: Colors.green,
                        buttontext: buttons[index],
                        textcolor: Colors.white,
                      );
                    }

                    //equal Button
                    else if (index == buttons.length - 1 ||
                        index == buttons.length - 2) {
                      return Buttons(
                        ontapped: () {
                          setState(() {
                            resultequal();
                          });
                        },
                        buttoncolor: Colors.deepPurple,
                        buttontext: buttons[index],
                        textcolor: Colors.white,
                      );
                    }
                    // Rest buttons

                    else {
                      return Buttons(
                        ontapped: () {
                          setState(() {
                            userquestion = userquestion + buttons[index];
                          });
                        },
                        buttoncolor: operators(buttons[index])
                            ? Colors.deepPurple
                            : Color.fromARGB(255, 189, 182, 182),
                        buttontext: buttons[index],
                        textcolor: operators(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                  }),
            ),
          ),
        ]),
      ),
    );
  }

  bool operators(String button) {
    if (button == '%' ||
        button == '/' ||
        button == '+' ||
        button == '-' ||
        button == '=' ||
        button == '*') {
      return true;
    } else {
      return false;
    }
  }

  void resultequal() {
    String finalquestion = userquestion;

    finalquestion = finalquestion.replaceAll('button', 'x');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    useranswer = eval.toString();
  }
}
