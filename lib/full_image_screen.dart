import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class FullImage extends StatelessWidget {
  final String photoGrapher_name; // variable to store the photographer name
  final String imageUrl; // stores the imageUrl passed from the Wallpaper screen

  const FullImage({super.key, required this.imageUrl,required this.photoGrapher_name});
  Future<void> setWallpaper(BuildContext context) async {
    // Check if permission is granted
    PermissionStatus status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Storage permission is required to set wallpaper.'),
        ),
      );
      return;
    }
    // Set wallpaper (replace 'HOME_SCREEN' or 'LOCK_SCREEN' for desired location)
    int location = WallpaperManager.HOME_SCREEN; // Set desired location
    bool result = (await WallpaperManager.setWallpaperFromFile(imageUrl, location));
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wallpaper set successfully!'),
        ),
      );
    } else {
      // Handle setting failure (optional)
      print('Wallpaper setting failed!');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.photo_camera_back_sharp,color: Colors.white,),
        title: Center(child: Text('Photo by '+ photoGrapher_name,style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)),
        backgroundColor: Colors.black, // Adjust app bar color as desired
      ),
      body: Column(
        children:[
          Expanded(
          child: InteractiveViewer(
            child: Image.network(imageUrl, fit: BoxFit.fill, // Adjust image fitting as needed
            ),
          ),
        ),
         const  SizedBox(height: 20,),
          InkWell( // this function takes the touch as input and output response is set by the user using the OnTap
            onTap: (){
              setWallpaper(context); // In our case we are calling the Loadmore function to load more images in the gridview
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5.0),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                color: Colors.white, // Set the container color
              ),
              child:  const Center(child: Text("Set as Wallpaper", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
            ),
          )
        ], 
      ),
    );
  }
}

