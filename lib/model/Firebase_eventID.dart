import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> eventSetup(String eventID, String eventName, String location, String description, String category, String creatorUID) async{

  CollectionReference events = FirebaseFirestore.instance.collection("Events");

  events.add({
    'eventID': eventID,
    'eventName': eventName,
    'location': location,
    'category': category,
    'description': description,
    // 'date': dateTime,
    'creator': creatorUID,
  });

  return;
}
