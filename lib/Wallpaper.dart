import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// API KEY: KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi

class Wallpapers extends StatefulWidget {
  const Wallpapers({super.key});

  @override
  State<Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
   List image = [];
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
        image = result['photos'];
      });
    }
    );
  }

  Future<dynamic>LoadmoreImage() async {
     setState(() {
       page_no += 1;
     });
     String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page_no';
     await http.get(
         Uri.parse(url), // This endpoint enables you to receive real-time photos curated by the Pexels team.
         headers: {
           'Authorization': 'KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi', // this is the api-key
         }).then((value) {
       Map result = jsonDecode(value.body);
       setState(() {
         image.addAll(result['photo']);
       });
     });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: null,
        title: Center(child: const Text("PexScape",style: TextStyle(fontWeight: FontWeight.w500),)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: image.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                         crossAxisSpacing: 5,
                          childAspectRatio: 2/2,
                           mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Image(image: NetworkImage(image[index]['src']['tiny']),fit: BoxFit.cover),
                      ),
                    );
                    }
                ),
              ),
          ),
         const  SizedBox(height: 10),
          InkWell(
            onTap: (){
              LoadmoreImage();
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Set the desired radius
                color: Colors.blueGrey, // Set the container color
              ),
              child:  const Center(child: Text("Load more", style: TextStyle(color: Colors.white, fontSize: 18),)),
            ),
          )
        ],
      ),
    );
  }
}
