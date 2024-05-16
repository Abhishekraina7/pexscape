import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pexscape/full_image_screen.dart';


// API KEY: KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi

class Wallpapers extends StatefulWidget {
  const Wallpapers({super.key});

  @override
  State<Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
   List<dynamic> image = [];
   int page_no  = 1;

   @override
  void initState() {
     super.initState();
     fetchapi();
   }

   Future<void>fetchapi() async {
    await http.get(
        Uri.parse('https://api.pexels.com/v1/curated'), // This endpoint enables you to receive real-time photos curated by the Pexels team.
        headers: {
          'Authorization': 'KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi', // this is the api-key
        }).then((value)
// print(value.body) // this prints the body of the response that comes from the api
    {
      Map result = jsonDecode(value.body); // json function which will decode the body response from the api into a map of key value pairs in json format
       setState(() {
        image = result['photos']; // this functions simply updates the state and lets the builder function know that some data (photos) is being added to the image list
      });
    }
    );
  }

  Future<dynamic>LoadmoreImage() async {
     setState(() {
       page_no = page_no + 1;
     });
     String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page_no';
     await http.get(
         Uri.parse(url), // This endpoint enables you to receive real-time photos curated by the Pexels team.
         headers: {
           'Authorization': 'KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi', // this is the api-key
         }).then((value) {
           if(value.statusCode == 200){ // if the response is okay
       Map result = jsonDecode(value.body); // we store the body of the json response in a map ( key-value pairs)
       print(result);
       setState(() {
         image.addAll(result['photos']); // this function adds all data of photo key value into the image list
       });}
           else{
             print("NO response");
           }
     });
   }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: null,
        title: const Center(child: Text("PexScape",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: GridView.builder( // grid view to show the images from api response
                  itemCount: image.length, // this means jitne photos api response mai ayege utni he grid items create hojayegei
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                         crossAxisSpacing: 5,
                          childAspectRatio: 2/2,
                           mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){

                    return GestureDetector( // GestureDetector function takes the touch as input and immediately transfers the Image url of the image to the FullImage screen
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FullImage(imageUrl: image[index]['src']['portrait'], photoGrapher_name: image[index]['photographer'],),)); // this is the path for pushing the url of the image on which the touch was detected
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(0)),
                        child: Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5.0),
                          child: Image(image: NetworkImage(image[index]['src']['tiny']),fit: BoxFit.cover),
                        ),
                      ),
                    );
                    }
                ),
              ),
          ),
         const  SizedBox(height: 10),
          InkWell( // this function takes the touch as input and output response is set by the user using the OnTap
            onTap: (){
              LoadmoreImage(); // In our case we are calling the Loadmore function to load more images in the gridview
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                color: Colors.white, // Set the container color
              ),
              child:  const Center(child: Text("Load more", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),)),
            ),
          )
        ],
      ),
    );
  }
}
