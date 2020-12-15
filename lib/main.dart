import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text("Local JSON file", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          child: Center(

            // Using future builder and DefaultAssetBundle to load local JSON file

            child: FutureBuilder(
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('lib/json/index.json'),
                builder: (context, snapshot) {

                  // Decoding JSON here
                  var myFile = json.decode(snapshot.data.toString());

                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListView.builder(

                      // Build the ListView
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                    child: Text("Name: " + myFile[index]['name'])),
                                Container( padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                    child: Text("Education: " + myFile[index]['Education'])),
                                Container(  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                    child: Text("Age: " + myFile[index]['age'])),

                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: myFile == null ? 0 : myFile.length,
                    ),
                  );
                }),
          ),
        ));
  }
}