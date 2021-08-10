import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  late double width;
  late double height;

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 40.0;
  double resultFontSize = 50.0;

  @override
  void didChangeDependencies() {
    width = Get.width;
    height = Get.height;

    super.didChangeDependencies();
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
        equationFontSize = 40.0;
        resultFontSize = 50.0;
      } else if (buttonText == "➡") {
        equationFontSize = 50.0;
        resultFontSize = 40.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 40.0;
        resultFontSize = 50.0;

        expression = equation;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('−', '-');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equationFontSize = 50.0;
          resultFontSize = 40.0;
          equation += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color? buttonColor,
      Color? textColor) {
    return Container(
      width: height * 0.1 * buttonHeight,
      height: height * 0.1 * buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: CircleBorder(),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.normal,
            color: textColor,
          ),
        ),
      ),
    );
  }

  TableRow verticalSpacingForOneButton() {
    return TableRow(
      children: [
        SizedBox(height: 15),
      ],
    );
  }

  TableRow verticalSpacingForThreeButtons() {
    return TableRow(
      children: [
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                maxLines: 1,
                style: TextStyle(
                  fontSize: equationFontSize,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: resultFontSize,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(child: Divider()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton("AC", 1, Colors.grey, Colors.black),
                          buildButton("➡", 1, Colors.grey, Colors.black),
                          buildButton("%", 1, Colors.grey, Colors.black),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("7", 1, Colors.grey[850], Colors.white),
                          buildButton("8", 1, Colors.grey[850], Colors.white),
                          buildButton("9", 1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("4", 1, Colors.grey[850], Colors.white),
                          buildButton("5", 1, Colors.grey[850], Colors.white),
                          buildButton("6", 1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("1", 1, Colors.grey[850], Colors.white),
                          buildButton("2", 1, Colors.grey[850], Colors.white),
                          buildButton("3", 1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton(".", 1, Colors.grey[850], Colors.white),
                          buildButton("0", 1, Colors.grey[850], Colors.white),
                          buildButton("00", 1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton("÷", 1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("×", 1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("−", 1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("+", 1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("=", 1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
