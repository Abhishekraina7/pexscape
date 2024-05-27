import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: Colors.yellow,
              child: const Center(child: Text("Space for creative or AI touch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),),
            ),
          ),

        ],
      ),
    );
  }
}
