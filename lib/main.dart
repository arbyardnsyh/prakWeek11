import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Async Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "Hasil akan ditampilkan di sini";

  Future<int> returnOne() async {
    await Future.delayed(const Duration(seconds: 2));
    return 1;
  }

  Future<int> returnTwo() async {
    await Future.delayed(const Duration(seconds: 2));
    return 2;
  }

  Future<int> returnThree() async {
    await Future.delayed(const Duration(seconds: 2));
    return 3;
  }

  void chainingExample() {
    returnOne()
      .then((value1) {
        print('Value 1: $value1');
        return returnTwo().then((value2) {
          print('Value 2: $value2');
          return returnThree().then((value3) {
            print('Value 3: $value3');
            int sum = value1 + value2 + value3; // Menggunakan value1, value2, value3 yang sudah didefinisikan
            print('Total Sum: $sum');
          });
        });
      })
      .catchError((error) {
        print('Error: $error');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Async Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              result,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Contoh penggunaan async di sini jika diperlukan
              },
              child: const Text('Hitung'),
            ),
            ElevatedButton(
              onPressed: () {
                chainingExample();
              },
              child: const Text('Run Chaining Example'),
            ),
          ],
        ),
      ),
    );
  }
}