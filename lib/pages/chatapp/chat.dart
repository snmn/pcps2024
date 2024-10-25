import 'package:flutter/material.dart';
import 'package:lab1/pages/chatapp/conversationpage.dart';
import 'package:lab1/static.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  
  conversationitem(var size){
    return GestureDetector(
     onTap: (){
       // chat
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) =>  Conversationpage()),
       );
     },
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
              ),
              margin: EdgeInsets.only(right: 15,left: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(StaticValue.defaulturl,height: 80,width: 80,
                    fit: BoxFit.cover,)),
            ),

            //name
            Column(
              children: [
                Text("name",style: TextStyle(color: Colors.black,fontSize: 18),),
                SizedBox(height: 10,),
                Text("datetime",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            )

          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     appBar: AppBar(),
     body: Column(
       children: [
         Container(
           width: size.width,
           height: size.height/1.2,
           child: ListView.builder(
             scrollDirection: Axis.vertical,
             itemCount: 10,
             itemBuilder: (context, index) {
               return conversationitem(size);
             },
           ),
         ),
       ],
     ),
   );
  }
}
