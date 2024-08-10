import 'package:flutter/material.dart';






class Containers extends StatefulWidget {
  const Containers({super.key, required this.height, required this.width,});
  final double height;
  final double width;


  @override
  State<Containers> createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5.0),
      height: widget.height,
      width: widget.width,
      decoration:  BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
