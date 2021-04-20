import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> eventSetup(String eventName, String location, String description, String category, String creatorUID) async{

  CollectionReference events = FirebaseFirestore.instance.collection("Events");

  DocumentReference eventDocID = events.doc();
  String eventID = eventDocID.id;

  events.doc(eventID).set({
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
