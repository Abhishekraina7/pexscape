import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';



class FullImage extends StatelessWidget {
  final String photoGrapher_name; // variable to store the photographer name
  final String imageUrl; // stores the imageUrl passed from the Wallpaper screen
  const FullImage({super.key, required this.imageUrl,required this.photoGrapher_name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.photo_camera_back_sharp,color: Colors.white,),
        title: Center(child: Text('Photo by '+ photoGrapher_name,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)),
        backgroundColor: Colors.black, // Adjust app bar color as desired
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl, fit: BoxFit.fill, // Adjust image fitting as needed
          ),
        ),
      ),
    );
  }
}

