import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'model/Firebase_eventID.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth =  FirebaseAuth.instance;
String createUID = auth.currentUser.uid.toString();

class EventsServices{

  Future<String> addEvent({String eventName, String location, String description, String category, String creatorUID}) async{

    String eventID = Uuid().toString();
      await eventSetup(eventID, eventName, location, description, category, creatorUID);
      return "Event added!";
  }
}