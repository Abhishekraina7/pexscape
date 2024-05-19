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
   final String api_Key = 'KxhCp0iVqaWOYPRux5rQ0jNZpXGi8DShHRTpZpSOpGJTzA0eI0sy7rhi';
   late String searchQuery;

   @override
  void initState() {
     super.initState();
     fetchapi();
   }

   Future<void> fetchapi({String query = ''}) async { // Optional query parameter
     String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page_no';
     if (query.isNotEmpty) {
       url = 'https://api.pexels.com/v1/search?query=$query&per_page=80&page=$page_no';
     }
     await http.get(
       Uri.parse(url),
       headers: {
         'Authorization': api_Key,
       },
     ).then((value) {
       if (value.statusCode == 200) {
         Map result = jsonDecode(value.body);
         setState(() {
           if (page_no == 1) {
             image = result['photos']; // Clear image list for initial search
           } else {
             image.addAll(result['photos']); // Add fetched images on load more
           }
         });
       } else {
         print("Error fetching data");
       }
     });
   }

   Future<dynamic> loadMoreImage() async {
     setState(() {
       page_no = page_no + 1;
     });
     await fetchapi(query: searchQuery); // Call fetchapi with updated page number and search query
   }

   void searchImages(String query) {
     setState(() {
       searchQuery = query;
       image = []; // Clear image list for new search
       page_no = 1; // Reset page number for new search
     });
     fetchapi(query: query); // Call fetchapi with the provided search query
   }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text("PexScape",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),)),
        automaticallyImplyLeading: false, // This line removes the back arrow which was coming bacause of Navigation from the SplashScreen
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              // This is used to take the seach query from the user
              child: Row(children: [
                SizedBox(
                  width: 330,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search wallpapers',
                      hintStyle: TextStyle(fontFamily: 'sans',color: Colors.grey),
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Update search query on input change
                        image = []; // Clear image list for new search
                        page_no = 1; // Reset page number for new search
                      });
                      fetchapi(); // Fetch images based on the new search query
                    },
                  ),
                ),
                const Icon(Icons.search,color: Colors.black,),
              ],
              ),
            ),
          ),
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
              loadMoreImage(); // In our case we are calling the Loadmore function to load more images in the gridview
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
