import 'package:flutter/material.dart';
import 'package:calculator/buttons_value.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

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
                  child: const Text(
                    "0",
                    style: TextStyle(
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
                      width: screen.width / 4,
                      height: screen.width / 4,
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
      padding: const EdgeInsets.all(3.7),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [Btn.subtract, Btn.add, Btn.multiply, Btn.divide, Btn.per].contains(value)
                ? Colors.orange
                : Colors.grey[900],
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(value),
          ),
        ),
      ),
    );
  }
}
