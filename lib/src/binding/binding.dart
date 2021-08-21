import 'package:calculator/src/controller/calculator_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController());
  }
}
