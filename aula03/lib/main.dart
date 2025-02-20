import 'package:flutter/material.dart';

void main() {
  runApp(MainApp(
    text: 'Hello World Nádegas',
  ));
}

class MainApp extends StatelessWidget {
  final String text;
  const MainApp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 48,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(30)),
                  fixedSize: WidgetStatePropertyAll(
                    Size(200, 80),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                onPressed: () {},
                child: Text(
                  'Nádegas',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
