import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 120, 80, 120),

            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/avocado.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Fresh items everyday",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          Spacer(),
          GestureDetector(
            onTap:
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: Text("Get Started", style: TextStyle(color: Colors.white)),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
