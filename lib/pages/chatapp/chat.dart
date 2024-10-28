import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab1/pages/chatapp/conversationpage.dart';
import 'package:lab1/static.dart';

import '../../model/chatmodel.dart';
import 'api/datalayer.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  
  conversationitem(var size, ConversationModel data){
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
                Text(data.name1,style: TextStyle(color: Colors.black,fontSize: 18),),
                SizedBox(height: 10,),
                Text(data.datetime!,style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            )

          ],
        ),
      ),
    );
  }


// Function to store a conversation with name and datetime
  Future<void> addConversation() async {
    // Reference to the Firestore collection
    CollectionReference conversations = FirebaseFirestore.instance.collection('CONVERSATIONS');
    try {
      // Add a new document with name and current datetime
      await conversations.add({
        'name1': "BOT"+ DateTime.now().day.toString(),
        'name2': "BOT"+ DateTime.now().day.toString(),
        'userId1': "1",
        'userId2': "2", // Stores'
        'datetime': DateTime.now().toIso8601String(),

      });
      print("Conversation added successfully");
    } catch (e) {
      print("Failed to add conversation: $e");
    }
  }


  late Future<List<ConversationModel>?> futureconversationdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addConversation();
    futureconversationdata = Datalayer.getConversations();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(

     body:  SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(height: 55,),
           Text("Random Chat Application",style: TextStyle(color: Colors.black,fontSize: 20),),

           FutureBuilder(
             future: futureconversationdata,
             builder: (context, AsyncSnapshot<dynamic> snapshot) {
               switch (snapshot.connectionState) {
                 case ConnectionState.none:
                 // network, server error
                   return Container(
                     height: size.height,
                     width: size.width, child:
                   const Center(child: Text("Server Error")),);
                 case ConnectionState.active:
                   return const CircularProgressIndicator();
                 case ConnectionState.waiting:
                   return const CircularProgressIndicator();
                 case ConnectionState.done:
                   List<ConversationModel>? dataa = snapshot.data;
                   return (snapshot.data != null || snapshot.hasData)?
                   Container(
                     width: size.width,
                     height: size.height/1.1,
                     child: ListView.builder(
                       scrollDirection: Axis.vertical,
                       itemCount: dataa!.length,
                       itemBuilder: (context, index) {
                         return conversationitem(size,dataa[index]);
                       },
                     ),
                   ):Container(
                     height: size.height/1.2,
                     width: size.width, child:
                   const Center(child: Text("No Data Available")),);
                 default:
                   return Container(
                     height: size.height,
                     width: size.width, child:
                   const Center(child: Text("Server Error")),);

               }
             },
           ),

         ],
       ),
     )
   );
  }
}
