import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  static String id = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return   Scaffold(
      backgroundColor: Colors.white,
     body: Stack(
       children: [
         const Positioned.fill( // Cover entire screen
           child: Image(
             image: AssetImage('assets/Designer.jpeg'),
             fit: BoxFit.cover, // Adjust fit as needed
           ),
         ),
         Positioned(
           bottom: 0,
           left: 0,
           right: 0,
         child: Column(
           children: [
             const Text('Explore Pexel',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
             const Text('Wallpaper',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
             const SizedBox(height: 15,),
             const Text('Get ready to be amazed',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ),),
             const SizedBox(height: 50,),
             Center(
               child: Container(
                 height: 50,
                 width: 350,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                   color: Colors.black, // Set the container color
                 ),
                 child: const Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Text('Get Started',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),),
                   SizedBox(width: 10,),
                   Icon(Icons.rocket_launch_sharp,color: Colors.white,),
                 ],),
               ),
             ),
             const SizedBox(height: 25,),
           ],
          ),
         ),
       ],
     ),
    );
  }
}
