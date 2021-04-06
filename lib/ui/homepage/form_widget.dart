import 'package:flutter/material.dart';

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

  final GlobalKey<_FormPageState> _formKey = GlobalKey<_FormPageState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Name',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
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
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
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
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
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
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
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
    return null;
  }

  Widget _buildGuests() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event'),
      backgroundColor:  Color(0xFF6F35A5)
      ),
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
             //_buildGuests(), 
              
              SizedBox(height: 60),
              ElevatedButton(
                child: Text('Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                onPressed: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
