import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _name;
  String _location;
  String _description;
  String _email;
  String _categpry;
  String _guests;
  String _date;

  final GlobalKey<_FormPageState> _formKey = GlobalKey<_FormPageState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Name',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLocation() {
    return TextFormField(
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
      onSaved: (String value) {
        _location = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
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
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildCategory() {
    String _value;
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem<String>(
          child: Text('Music'),
          value: 'one',
        ),
        DropdownMenuItem<String>(
          child: Text('Meet up'),
          value: 'two',
        ),
        DropdownMenuItem<String>(
          child: Text('Golf'),
          value: 'three',
        ),
        DropdownMenuItem<String>(
          child: Text('Birthday'),
          value: 'four',
        ),
        DropdownMenuItem<String>(
          child: Text('Cook Out'),
          value: 'five',
        ),
      ],
      onChanged: (String value) {
        setState(() {
          _value = value;
        });
      },
      value: _value,
      hint: Text('Category'),
    );
  }

  Widget _buildGuests() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Number of Guests',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Number is required';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildDate() {
    return DateTimePicker(
    initialValue: '',
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    dateLabelText: 'Date',
    onChanged: (val) => print(val),
    validator: (val) {
    print(val);
    return null;
  },
  onSaved: (val) => print(val),
);
  }

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
              _buildEmail(),
              SizedBox(height: 10),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(width: 100, child: _buildCategory()),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight ,
                    child: Container(width: 100, child: _buildDate()),
                    )
                ],
              ),
              //_buildGuests(),
              SizedBox(height: 10),

              ElevatedButton(
                  child: Text('Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
