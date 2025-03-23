import 'package:flutter/material.dart';
import 'package:groceryapp/pages/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
    _navigateToIntro();
  }

  _navigateToIntro() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    _controller.reverse();
    await Future.delayed(const Duration(seconds: 1), () {});
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon.png', height: 80), // Asegúrate de tener el logo en esta ruta
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Bienvenido a GroceryApp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}