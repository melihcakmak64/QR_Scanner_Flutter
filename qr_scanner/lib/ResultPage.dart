import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  final String result;
  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scan Result:",
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            InkWell(
              onTap: () {
                copy(result);
              },
              child: Text(
                result,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Text("You can touch to copy the result")
          ],
        ),
      ),
    );
  }
}

void copy(String text) {
  var value = ClipboardData(text: text);
  Clipboard.setData(value);
}
