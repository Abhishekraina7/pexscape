import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart'; // Flutter plugin for getting commonly used locations on host platform file systems, such as the temp and app data directories.
import 'package:http/http.dart' as http;

class FullImage extends StatelessWidget {
  final String photoGrapher_name; // variable to store the photographer name
  final String imageUrl; // stores the imageUrl passed from the Wallpaper screen

  FullImage({super.key, required this.imageUrl,required this.photoGrapher_name});
  Future<void> downloadImage(BuildContext context) async {
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

    final directory = await getApplicationDocumentsDirectory();
    final fileName = Uri.parse(imageUrl).pathSegments.last; // Extract filename from URL
    final filePath = '${directory.path}/$fileName';

    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        await File(filePath).writeAsBytes(bytes);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image downloaded to: $filePath'),
          ),
        );
        print(filePath);
        print(directory.path);
      } else {
        print('Download failed with status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image download failed!'),
          ),
        );
      }
    } catch (error) {
      print('Error downloading image: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while downloading the image.'),
        ),
      );
    }

    // Set wallpaper (replace 'HOME_SCREEN' or 'LOCK_SCREEN' for desired location)
    // int location = WallpaperManager.HOME_SCREEN; // Set desired location
    // bool result = (await WallpaperManager.setWallpaperFromFile(imageUrl, location));
    // if (result) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Wallpaper set successfully!'),
    //     ),
    //   );
    // } else {
    //   // Handle setting failure (optional)
    //   print('Wallpaper setting failed!');
    // }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                  color: Colors.white, // Set the container color
                ),
                child:  const Center(child: Text("Set as Wallpaper", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
              ),
              const SizedBox(width: 50,),

              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                  color: Colors.white, // Set the container color
                ),
                child:  InkWell(
                  onTap: (){
                    downloadImage(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Center(child:
                       Text("Download", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),),
                       Icon(Icons.download,color: Colors.black,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ], 
      ),
    );
  }
}

