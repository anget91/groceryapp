import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:groceryapp/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.notoSerif();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
