import 'package:calculator/src/binding/binding.dart';
import 'package:calculator/src/getx_calculator.dart';
import 'package:calculator/src/simple_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialBinding: Binding(),
      // home: SimpleCalculator(),
      home: GetxCalculator(),
    );
  }
}
