import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../model/chatmodel.dart';

class Datalayer{
  // Function to read data from Firebase Realtime Database
  static Future<List<ChatModel>?> readfromdb() async {
    List<ChatModel> chatDataList = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('chat').get();

    if (snapshot.exists) {
      // Convert snapshot data to a Map
      Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);

      // Iterate through each entry in the data
      for (var entry in data.values) {
        // Directly map entry to ChatModel without using json.decode
        ChatModel chatModel = ChatModel.fromJson(Map<String, dynamic>.from(entry));
        chatDataList.add(chatModel);
      }
      print('Data added to list: $chatDataList');
      return chatDataList;
    } else {
      print('No data available.');
      return null;
    }
  }

  // Function to get conversations and return them as List<ConversationModel>?
  static Future<List<ConversationModel>?> getConversations() async {
    CollectionReference conversations = FirebaseFirestore.instance.collection('CONVERSATIONS');
    List<ConversationModel> conversationsList = [];

    try {
      // Fetch all documents from the collection
      QuerySnapshot querySnapshot = await conversations.get();

      // Check if data exists
      if (querySnapshot.docs.isNotEmpty) {
        // Loop through documents and map them to ConversationModel instances
        for (var doc in querySnapshot.docs) {
          conversationsList.add(ConversationModel.fromFirestore(doc.data() as Map<String, dynamic>));
        }
        print("Conversations fetched successfully: $conversationsList");
        return conversationsList;  // Return the list of ConversationModel
      } else {
        print("No conversations available.");
        return null;
      }
    } catch (e) {
      print("Failed to get conversations: $e");
      return null;
    }
  }

}