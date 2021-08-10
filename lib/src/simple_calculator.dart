import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleCalculator extends StatefulWidget {
  SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  late double width;
  late double height;

  @override
  void didChangeDependencies() {
    width = Get.width;
    height = Get.height;

    super.didChangeDependencies();
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

  Widget buildButton(
      String buttonText, double buttonHeight, Color? buttonColor) {
    return Container(
      width: height * 0.1 * buttonHeight,
      height: height * 0.1 * buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: CircleBorder(),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
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
                "0",
                style: TextStyle(
                  fontSize: 38.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 48.0,
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
                          buildButton("AC", 1, Colors.grey),
                          buildButton("+/−", 1, Colors.grey),
                          buildButton("%", 1, Colors.grey),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("7", 1, Colors.grey[850]),
                          buildButton("8", 1, Colors.grey[850]),
                          buildButton("9", 1, Colors.grey[850]),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("4", 1, Colors.grey[850]),
                          buildButton("5", 1, Colors.grey[850]),
                          buildButton("6", 1, Colors.grey[850]),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("1", 1, Colors.grey[850]),
                          buildButton("2", 1, Colors.grey[850]),
                          buildButton("3", 1, Colors.grey[850]),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton(".", 1, Colors.grey[850]),
                          buildButton("0", 1, Colors.grey[850]),
                          buildButton("00", 1, Colors.grey[850]),
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
                          buildButton("÷", 1, Colors.orange[800]),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("×", 1, Colors.orange[800]),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("−", 1, Colors.orange[800]),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("+", 1, Colors.orange[800]),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton("=", 1, Colors.orange[800]),
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
