import 'package:flutter/material.dart';
import 'package:lab1/pages/chatapp/chat.dart';
import 'package:lab1/static.dart';


class chatlogin extends StatefulWidget {
  const chatlogin({super.key});

  @override
  State<chatlogin> createState() => _chatloginState();
}

class _chatloginState extends State<chatlogin> {

  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon // background
            Container(
            height: size.height/5,child: Center(child: Icon(Icons.people,size: 70,))),
            //text
            Container(
              color: Colors.black26,
              width: size.width,
              height: size.height/10,
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Name",
                    hintStyle: TextStyle(color: Colors.white)
                    ),
                  style:const TextStyle(fontSize: 18,
                    fontWeight: FontWeight.normal,color: Colors.white),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  controller: namecontroller,
                  onEditingComplete: (){
                  StaticValue.username = namecontroller.text;
                  },

                ),
              ),
            ),
            //button
            GestureDetector(
              onTap: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  chat()),
                      );
              },
              child: Container(
                height: 55,
                width: 100,
                margin: EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(color: Colors.orange,
                borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text("Continue",style: TextStyle(color: Colors.white),)),

              ),
            )
          ],
        ),
      ),
    );
  }
}
