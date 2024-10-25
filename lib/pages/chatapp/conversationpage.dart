import 'package:flutter/material.dart';

class Conversationpage extends StatefulWidget {
  const Conversationpage({super.key});

  @override
  State<Conversationpage> createState() => _ConversationpageState();
}

class _ConversationpageState extends State<Conversationpage> {

  leftsidedataitem(size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 15),
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
            child: Text("Left side item",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }

  rightsidedataitem(size){
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.only(left: 20,right: 5,top: 10,bottom: 10),
            width: size.width/1.2,
            child: Text("Right side item",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }

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
            width: size.width/1.5,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style:const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.normal,color: Colors.black87),
              maxLines: 1,
              textAlign: TextAlign.center,
              controller: textcontroller,
              onEditingComplete: (){
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0,left: 5,top: 5,bottom: 5),
            child: Icon(Icons.send,color: Colors.white,size: 22,),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                leftsidedataitem(size),
                SizedBox(height: 5,),
                rightsidedataitem(size)
              ],
            ),
          ),

          buttonwithtext(size),

        ],
      ),
    );
  }
}
