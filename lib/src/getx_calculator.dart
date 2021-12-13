import 'package:calculator/src/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxCalculator extends GetView<CalculatorController> {
  Widget buildButton(String buttonText, double buttonHeight, Color? buttonColor,
      Color? textColor) {
    return Container(
      width: controller.height * buttonHeight,
      height: controller.height * buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: () => controller.buttonPressed(buttonText),
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

  // 가로축 버튼들 사이 높이
  TableRow verticalSpacingForThreeButtons() {
    return TableRow(
      children: [
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
      ],
    );
  }

  // 버튼 제일 우측 끝, 주황색 버튼 사이 높이
  TableRow verticalSpacingForOneButton() {
    return TableRow(
      children: [
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
            // 수식 영역
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Obx(
                () => Text(
                  controller.equation.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: controller.equationFontSize.toDouble(),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // 결과 값 영역
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Obx(
                () => Text(
                  controller.result.toString(),
                  style: TextStyle(
                    fontSize: controller.resultFontSize.toDouble(),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Divider위젯을 Expanded위젯으로 감싸서, 중간 영역을 모두 차지
            Expanded(child: Divider()),
            // 계산기 버튼 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: controller.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton("AC", 0.1, Colors.grey, Colors.black),
                          buildButton("➡", 0.1, Colors.grey, Colors.black),
                          buildButton("%", 0.1, Colors.grey, Colors.black),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("7", 0.1, Colors.grey[850], Colors.white),
                          buildButton("8", 0.1, Colors.grey[850], Colors.white),
                          buildButton("9", 0.1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("4", 0.1, Colors.grey[850], Colors.white),
                          buildButton("5", 0.1, Colors.grey[850], Colors.white),
                          buildButton("6", 0.1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton("1", 0.1, Colors.grey[850], Colors.white),
                          buildButton("2", 0.1, Colors.grey[850], Colors.white),
                          buildButton("3", 0.1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                      TableRow(
                        children: [
                          buildButton(".", 0.1, Colors.grey[850], Colors.white),
                          buildButton("0", 0.1, Colors.grey[850], Colors.white),
                          buildButton(
                              "00", 0.1, Colors.grey[850], Colors.white),
                        ],
                      ),
                      verticalSpacingForThreeButtons(),
                    ],
                  ),
                ),
                Container(
                  width: controller.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton(
                              "÷", 0.1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton(
                              "×", 0.1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton(
                              "−", 0.1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton(
                              "+", 0.1, Colors.orange[800], Colors.white),
                        ],
                      ),
                      verticalSpacingForOneButton(),
                      TableRow(
                        children: [
                          buildButton(
                              "=", 0.1, Colors.orange[800], Colors.white),
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
