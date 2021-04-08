import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:localeventsapp/events_services.dart';
import 'package:localeventsapp/model/Firebase_eventID.dart';
import 'package:provider/provider.dart';

CollectionReference userEvents = FirebaseFirestore.instance.collection("Events");
FirebaseAuth auth =  FirebaseAuth.instance;
String uid = auth.currentUser.uid.toString();


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController creatorController = TextEditingController();
  String categoryID;
  int dateTime;
  // final TextEditingController dateController = TextEditingController();

  final GlobalKey<_FormPageState> _formKey = GlobalKey<_FormPageState>();

  Widget _buildName() {
    return TextFormField(
      controller: eventNameController,
      decoration: InputDecoration(
          labelText: 'Event Name',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
    );
  }

  Widget _buildLocation() {
    return TextFormField(
      controller: locationController,
      decoration: InputDecoration(
          labelText: 'Location',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location is required';
        }
        return null;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(
          labelText: 'Description',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }
        return null;
      },
    );
  }

  Widget _buildCategory() {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem<String>(
          child: Text('Music'),
          value: '1',
        ),
        DropdownMenuItem<String>(
          child: Text('Meet up'),
          value: '2',
        ),
        DropdownMenuItem<String>(
          child: Text('Golf'),
          value: '3',
        ),
        DropdownMenuItem<String>(
          child: Text('Birthday'),
          value: '4',
        ),
        DropdownMenuItem<String>(
          child: Text('Cook Out'),
          value: '5',
        ),
      ],
      onChanged: (String value) {
        setState(() {
          categoryID = value;
        });
      },
      value: categoryID,
      hint: Text('Category'),
    );
  }

  // Widget _buildDate() {
  //   DateTime currentDate = DateTime.now();
  //   DateTimePicker(
  //   type: DateTimePickerType.dateTimeSeparate,
  //   dateMask: 'd MMM, yyyy',
  //   initialValue: DateTime.now().toString(),
  //   firstDate: DateTime(2000),
  //   lastDate: DateTime(2100),
  //   icon: Icon(Icons.event),
  //   dateLabelText: 'Date',
  //   timeLabelText: "Time",
  //   onChanged:
  //       (val) => print(val),
  //   validator: (val) {
  //     print(val);
  //     return null;
  //   },
  //   onSaved: (val) => print(val),
  // );
  // }

  // Widget _buildDate(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(dateTime == null ? 'Nothing has been picked yet' : dateTime.toString()),
  //           RaisedButton(
  //             child: Text('Pick a date'),
  //             onPressed: () {
  //               showDatePicker(
  //                   context: context,
  //                   initialDate: dateTime == null ? DateTime.now() : dateTime,
  //                   firstDate: DateTime(2001),
  //                   lastDate: DateTime(2021)
  //               ).then((date) {
  //                 setState(() {
  //                   dateTime = date.millisecondsSinceEpoch;
  //                 });
  //               });
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create Event'), backgroundColor: Color(0xFF6F35A5)),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              SizedBox(height: 10),
              _buildLocation(),
              SizedBox(height: 10),
              _buildDescription(),
              SizedBox(height: 10),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(width:100, child: _buildCategory()),
                  ),
                  Spacer(),
                  // Align(
                  //   alignment: Alignment.bottomRight ,
                  //   child: Container(width: 200, child: _buildDate(context)),
                  //   ),
                ],
              ),
              //_buildGuests(),
              SizedBox(height: 1),

              ElevatedButton(
                  child: Text('Create Event',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  onPressed: () {
                    context.read<EventsServices>().addEvent(
                      eventName: eventNameController.text.trim(),
                      location: locationController.text.trim(),
                      description: descriptionController.text.trim(),
                      category: categoryID.trim(),
                      // dateTime: dateTime,
                      creatorUID: uid,
                    );

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
