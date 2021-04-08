import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localeventsapp/model/category.dart';
import 'package:localeventsapp/model/event.dart';
import 'package:localeventsapp/styleguide.dart';
import 'package:localeventsapp/ui/event_details/event_details_page.dart';
import 'package:localeventsapp/ui/homepage/form_widget.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../authentication_service.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

CollectionReference users = FirebaseFirestore.instance.collection("Users");
FirebaseAuth auth =  FirebaseAuth.instance;
String uid = auth.currentUser.uid.toString();
String docID = users.doc(uid).toString();

// void retrieveUsername() async{
//   DocumentReference documentReference = users.doc(uid);
//   documentReference.get().then((datasnapshot) {
//     if (datasnapshot.exists) {
//       print(datasnapshot.data()['displayName'].toString(););
//     }
//     else{
//       print("No such user");
//     }
//   );
// }
//

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "TuLink",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "Let's Mingle",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                          SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final category in categories)
                                CategoryWidget(category: category),
                         
                            ],
                          ),
                        ),
                      ),
                    ),      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for (final event in events.where((e) => e
                                .categoryIds
                                .contains(appState.selectedCategoryId)))
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EventDetailsPage(event: event),
                                    ),
                                  );
                                },
                                child: EventWidget(
                                  event: event,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton.extended(
                     onPressed: () {
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => FormPage()));
                     },
                     label: Text('Create'),
                     icon: Icon(Icons.create),
                     elevation: 2,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                     backgroundColor: Color(0xFF6F35A5),
                    ),
                    ElevatedButton(
                  child: Text('Sign Out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}



