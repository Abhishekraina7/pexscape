import 'package:flutter/material.dart';
import 'package:pexscape/bottom_navigation_bar.dart';
import 'package:shimmer/shimmer.dart';

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
             image: AssetImage('Images/Pinterest1.jpg'),
             fit: BoxFit.cover, // Adjust fit as needed
           ),
         ),
         Positioned(
           bottom: 0,
           left: 0,
           right: 0,
         child: Column(
           children: [
             // const Text('No Fucking',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),),
             // const Text('Excuses',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),),
             // const SizedBox(height: 15,),
             // const Text('And ',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,color: Colors.white),),
             const SizedBox(height: 50,),
             Center(
               child: InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav()),
                   );
                   },
                 child: Container(
                   height: 50,
                   width: 350,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.blue,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                     color: Colors.white, // Set the container color
                   ),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Shimmer.fromColors(
                           baseColor: Colors.blue,
                           highlightColor: Colors.red,
                           child:  const Text("Get Started",
                               style: TextStyle(
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,
                               ),),),
                       const SizedBox(width: 15,),
                       Shimmer.fromColors(
                         baseColor: Colors.blue,
                         highlightColor: Colors.red,
                         child:  const Icon(Icons.rocket_launch
                         ,color: Colors.black,
                         ),),
                   ],),
                 ),
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
