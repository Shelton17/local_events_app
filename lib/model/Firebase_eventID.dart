import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

Future<void> eventSetup(String eid, String eventName, String location, String description, String category, DateTime dateTime) async{
  CollectionReference events = FirebaseFirestore.instance.collection("Events");
  FirebaseAuth auth =  FirebaseAuth.instance;

  String eid = Uuid().toString();
  events.add({
    'eventID': eid,
    'eventName': eventName,
  });

  return;
}
