import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lab1/model/chatmodel.dart';
import 'package:lab1/pages/chatapp/api/datalayer.dart';
import 'package:lab1/static.dart';

class Conversationpage extends StatefulWidget {
  const Conversationpage({super.key});

  @override
  State<Conversationpage> createState() => _ConversationpageState();
}

class _ConversationpageState extends State<Conversationpage> {


  leftsidedataitem(size,ChatModel data) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.only(left: 20,right: 5,top: 10,bottom: 10),
            width: size.width/1.2,
            child: Text(data.text!,style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }

  rightsidedataitem(size,ChatModel data){
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 10),
            margin: EdgeInsets.only(right: 20),
            width: size.width/1.2,
            child: Text(data.text!,style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }


  //addtorealtimedatabase
  addtodb(String text,int type ) async {
    String chatId =  DateTime.now().millisecondsSinceEpoch.toString();
    DatabaseReference ref = FirebaseDatabase.instance.ref("chat/$chatId");

    await ref.set({
      "userId1": "2",
      "userId2": "18",
      "username1": StaticValue.username,
      "username2": "Bot25",
      "address": "",
      "text": text,
      "type": "0", // 0 for text and 1 for image
      "createdAt":  DateTime.now().millisecondsSinceEpoch.toString()
    });
  }
  late Future<List<ChatModel>?> futureconversationdata;

  TextEditingController textcontroller = TextEditingController();

  buttonwithtext(size){
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: size.width/1.2,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style:const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.normal,color: Colors.black87),
              maxLines: 1,
              textAlign: TextAlign.start,
              controller: textcontroller,
              // onEditingComplete: (){
              // addtodb(textcontroller.text, 0);
              // textcontroller.clear();
              // },
            ),
          ),
          GestureDetector(
            onTap: (){
              addtodb(textcontroller.text, 0);
              textcontroller.clear();
              Future.delayed(Duration(milliseconds: 10)).whenComplete((){
                setState(() {
                  handlerefresh();
                });
              });

            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0,left: 5,top: 5,bottom: 5),
              child: Icon(Icons.send,color: Colors.white,size: 22,),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureconversationdata = Datalayer.readfromdb();
  }

  handlerefresh(){
    futureconversationdata = Datalayer.readfromdb();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: size.height/1.12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
               // height: size.height/1.25,
                child: FutureBuilder(
                  future: futureconversationdata,
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      // network, server error
                        return Container(
                          height: size.height/2,
                          width: size.width, child:
                        const Center(child: Text("Server Error")),);
                      case ConnectionState.active:
                     //   return const CircularProgressIndicator();
                      case ConnectionState.waiting:
                     //   return const CircularProgressIndicator();
                      case ConnectionState.done:
                        List<ChatModel>? dataa = snapshot.data;
                        return (snapshot.data != null || snapshot.hasData)?
                        Container(
                          width: size.width,
                          padding: EdgeInsets.only(bottom: 15),
                      //    height: size.height/1.25,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            reverse: true,
                            primary: true,
                            itemCount: dataa!.length,
                            itemBuilder: (context, index) {
                              return dataa[index].username1 == StaticValue.username?
                              rightsidedataitem(size, dataa[index]):
                              leftsidedataitem(size,dataa[index]);
                            },
                          ),
                        ):Container(
                          height: size.height/2,
                          width: size.width, child:
                        const Center(child: Text("No Data Available")),);
                      default:
                        return Container(
                          height: size.height/2,
                          width: size.width, child:
                        const Center(child: Text("Server Error")),);
                    }
                  },
                ),
              ),
              buttonwithtext(size),
            ],
          ),
        ),
      ),
    );
  }
}
