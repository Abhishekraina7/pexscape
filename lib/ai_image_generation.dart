import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';




class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
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
            height: MediaQuery.of(context).size.height * 0.1,
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
                  width: 170,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Text('History',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17,color: Colors.grey),),
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
                     // Update search query on input change
                });
              },
            ),
          ),
          Container(
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
            height: 30,
          ),
          Container(
            height: 20,
            padding: const EdgeInsets.only(left: 30),
            child: const Align(
              alignment: Alignment.centerLeft,
                child:  Text('Inspirations',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
          ),
          Expanded(
            child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5.0),
                decoration:  BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5.0),
                decoration:  BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}

//
// SizedBox(
// width: MediaQuery.of(context).size.width * 1, // This makes the width of sized box adjust automattically with the screen on different mobile phones
// height: MediaQuery.of(context).size.height * 0.5,
// child: Container(
// color: Colors.yellow,
// child: const Center(child: Text("Space for creative or AI touch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),),
// ),
// ),