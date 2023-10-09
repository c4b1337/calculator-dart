import 'package:flutter/material.dart';
import 'package:calculator/buttons_value.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ""; // . 0-9 numbers
  String operand = ""; // + - * / %
  String number2 = ""; // . 0-9 numbers

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                        ? "0"
                        : "$number1$operand$number2",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            //buttons
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value == Btn.n0
                          ? screenSize.width / 2
                          : (screenSize.width / 4),
                      height: screenSize.width / 4,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: getBtnColor(value),
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

//On button tap.

void onBtnTap (String value){

  if (value!=Btn.dot&&int.tryParse(value)==null){
    if(operand.isNotEmpty&&number2.isNotEmpty){

    }
    operand = value;
  }else if (number1.isEmpty || operand.isEmpty){
    if (value==Btn.dot && number1.contains(Btn.dot)) return;
    if (value==Btn.dot && number1.isEmpty || number1==Btn.n0) {
      value = "0.";
    }
    number1 += value;
  }else if (number2.isEmpty || operand.isNotEmpty){
    if (value==Btn.dot && number2.contains(Btn.dot)) return;
    if (value==Btn.dot && number2.isEmpty || number2==Btn.n0) {
      value = "0.";
    }
    number2 += value;
  
  }

  setState(() {});
}

  Color? getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [Btn.subtract, Btn.add, Btn.multiply, Btn.divide, Btn.per]
                .contains(value)
            ? Colors.orange
            : Colors.grey[900];
  }
}
