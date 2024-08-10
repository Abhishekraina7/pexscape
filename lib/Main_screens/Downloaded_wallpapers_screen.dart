import 'package:flutter/material.dart';




class Downloaded extends StatefulWidget {
  const Downloaded({super.key});

  @override
  State<Downloaded> createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body:   Center(child: Text("This is Downloaded screen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
    );
  }
}
