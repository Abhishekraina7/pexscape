import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pexscape/Resuable_components/Containers.dart';
import 'ai_imagery_result_screen.dart';
//
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  late String input_query; // variable for storing the user prompt

  @override

  void initState()
  {
    super.initState();
    api_calling_function();
  }

  Future<Uint8List> api_calling_function ({String query = ''}) async {
    final url = Uri.parse('https://api-inference.huggingface.co/models/Artples/LAI-ImageGeneration-vSDXL-2');
    final headers = {
      'Authorization': 'Bearer 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',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(query),
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<void > generate_image ()  async{// this function is called when you click on the create button on the UI

    await api_calling_function(query: input_query);
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: const Text('Imagine', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'sans'),),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 30,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                    shape:BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))
                ),
              ),
            )
          ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 25),
                    child: const Text('Type your idea',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Row(
                      children: <Widget>[
                        Icon(Icons.history,color: Colors.grey,),
                       Text('History',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17,color: Colors.grey),
                      ),
                  ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 350,
            height: 250,
            child: TextField(
              minLines: 8,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Describe your idea here',
                hintStyle: TextStyle(fontFamily: 'sans',color: Colors.grey),
                focusColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black), // change to your desired color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.grey), // change to your desired color
                ),
              ),
              onChanged: (value) {
                setState(() {
                  input_query = value;
                });
              },
            ),
          ),
          GestureDetector( // When prompt is entered press this to make the api call
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Ai_Output_Screen()));
              setState(() {
              generate_image();
              });},
            child: Container(
              padding: const EdgeInsets.fromLTRB(110, 15, 10, 10),
              height: 60,
              width: 300,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  shape:BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))
              ),
              child: const  Text('Create',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
           const SizedBox(
            height: 30,
          ),
          Container(
            height: 0.2,
            decoration: const BoxDecoration(
                color: Colors.grey
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 20,
            padding: const EdgeInsets.only(left: 30),
            child: const Align(
              alignment: Alignment.centerLeft,
                child:  Text('Inspirations',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Containers(height: 500, width: 180),
              Containers(height: 500, width: 180),
              Containers(height: 500, width: 180),
              Containers(height: 500, width: 180),
              Containers(height: 500, width: 180),
            ],
          ),
          ),
        ],
      ),
    );
  }
}





