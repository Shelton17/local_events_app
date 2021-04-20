import 'package:firebase_auth/firebase_auth.dart';
import 'model/Firebase_event.dart';

FirebaseAuth auth =  FirebaseAuth.instance;
String createUID = auth.currentUser.uid.toString();

class EventsService{

  Future<String> addEvent({String eventName, String location, String description, String category, String creatorUID}) async{

      await eventSetup(eventName, location, description, category, creatorUID);
      return "Event added!";

  }
}