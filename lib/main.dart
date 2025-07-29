import 'package:flutter/material.dart';
import 'package:flooring_price_quote/pyeong_calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flooring Price Quote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _buildMenuButton(
                  context,
                  icon: Icons.square_foot,
                  label: '장판 평수',
                  color: Colors.lightBlue[400]!, // 첫 번째 버튼 색상
                  onPressed: () {
                    // TODO: Navigate to Jangpan Pyeong page
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildMenuButton(
                  context,
                  icon: Icons.transform,
                  label: '평수 계산기',
                  color: Colors.teal[400]!, // 두 번째 버튼 색상
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PyeongCalculatorScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onPressed}) {
    return AspectRatio(
      aspectRatio: 1, // Makes the button square
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 8,
          padding: const EdgeInsets.all(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 80),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}