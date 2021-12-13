import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  double width = Get.width;
  double height = Get.height;
  RxString equation = "0".obs;
  RxString result = "0".obs;
  RxString expression = "0".obs;
  RxDouble equationFontSize = 40.0.obs;
  RxDouble resultFontSize = 50.0.obs;

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      equation("0");
      result("0");
      equationFontSize(40.0);
      resultFontSize(50.0);
    } else if (buttonText == "➡") {
      equationFontSize(50.0);
      resultFontSize(40.0);

      equation(equation.substring(0, equation.value.length - 1));
      if (equation.value == "") {
        equation("0");
        equationFontSize(40.0);
        resultFontSize(50.0);
      }
    } else if (buttonText == "%") {
      equationFontSize(40.0);
      resultFontSize(50.0);
      expression = equation;

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression.value);

        ContextModel cm = ContextModel();
        result('${exp.evaluate(EvaluationType.REAL, cm) / 100} ');
      } catch (e) {
        result("Error");
      }
    } else if (buttonText == "=") {
      equationFontSize(40.0);
      resultFontSize(50.0);

      expression(equation.value);
      expression(expression.replaceAll('÷', '/'));
      expression(expression.replaceAll('×', '*'));
      expression(expression.replaceAll('−', '-'));

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression.value);

        ContextModel cm = ContextModel();
        result('${exp.evaluate(EvaluationType.REAL, cm)}');
      } catch (e) {
        result("Error");
      }
    } else {
      if (equation.value == "0") {
        equation(buttonText);
      } else {
        equationFontSize(50.0);
        resultFontSize(40.0);
        equation(equation + buttonText);
      }
    }
  }
}
