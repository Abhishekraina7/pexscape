import 'package:flutter/material.dart';
import 'package:pexscape/splash_screeb.dart';



void main()
{
  runApp(const Pexscape());
}


class Pexscape extends StatelessWidget {
  const Pexscape({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:const AppBarTheme(color: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        textTheme:const TextTheme(bodyMedium: TextStyle(color: Colors.black,fontFamily: 'sans')),
      ),
       home: const SplashScreen(),
    );
  }
}
