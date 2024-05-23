import 'package:flutter/material.dart';




class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body:   Center(child: Text("This is category screen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
    );
  }
}
