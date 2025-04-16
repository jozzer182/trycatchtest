import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Try-Catch Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              String someGoodString = '';
              List dataAsListMap = [];
              //Some Logic around here..
              someGoodString = dataAsListMap[0]['elementDoesntExist'].toString();
            } catch (e) {
              showDialog(
                context: context,
                builder:
                    (BuildContext context) => AlertDialog(
                      title: const Text('Error Caught'),
                      content: Text('Error details: $e'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
              );
            }
          },
          child: const Text('Test Array Error'),
        ),
      ),
    );
  }
}
