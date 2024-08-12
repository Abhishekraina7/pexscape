import 'package:flutter/material.dart';
import 'package:pexscape/Main_screens/ai_image_gen_promt_screen.dart';




class Ai_Output_Screen extends StatefulWidget {
  const Ai_Output_Screen({super.key});

  @override
  State<Ai_Output_Screen> createState() => _Ai_Output_ScreenState();
}

class _Ai_Output_ScreenState extends State<Ai_Output_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 30,
              width: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape:BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: const Icon(Icons.file_download_outlined),
            ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body:
      Padding(
        padding: const  EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: <Widget>
          [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 450,
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              //TODO: Make this a listview builder
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:  [
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0,top: 5.0),
                  height: 20,
                  width: 60,
                  decoration:  BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextField(
                enabled: true,
                readOnly: true,
                minLines: 8,
                maxLines: null,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Categories()));
                      },
                      child: const Icon(Icons.edit_outlined)),
                  hintText: 'Describe your idea here',
                  hintStyle: const TextStyle(fontFamily: 'sans',color: Colors.grey),
                  focusColor: Colors.black,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black), // change to your desired color
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey), // change to your desired color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),

            GestureDetector( // When prompt is entered press this to make the api call
              onTap: (){
                setState(() {
                  // TODO: when you click here you again call make api call with same prompt
                });},
              child: Container(
                padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    shape:BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.add,color: Colors.white,),
                    SizedBox(width: 10),
                    Text('Create More',style: TextStyle(fontSize: 22,color: Colors.white),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
