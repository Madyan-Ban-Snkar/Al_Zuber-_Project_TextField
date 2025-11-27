import 'package:flutter/material.dart';
import 'second_screen.dart'; // استيراد ملف الشاشة الثانية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstController = TextEditingController();

  final TextEditingController _secondController = TextEditingController();

  void _printText() {
    String textToPrint = _firstController.text;

    _secondController.text = textToPrint;
  }

  void _navigateToSecondScreen() {
    String textToPass = _firstController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(textFromFirstField: textToPass),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The main Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _firstController,
              decoration: const InputDecoration(
                labelText: 'Enter your name here : ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _printText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(15),
              ),
              child: const Text('Enter '),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _secondController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Here will show what yuo writed',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: _navigateToSecondScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(15),
              ),
              child: const Text(' Go to second page'),
            ),
          ],
        ),
      ),
    );
  }
}
