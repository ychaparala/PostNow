import 'package:flutter/material.dart';
import 'package:first_app/models/post.dart';
import 'package:first_app/services/firebase.dart';
import 'package:location/location.dart';

class GenericPost extends StatefulWidget {
  final String type;
  GenericPost(this.type);
  @override
  _GenericPostState createState() => _GenericPostState();
}

class _GenericPostState extends State<GenericPost> {
  final formKey = new GlobalKey<FormState>();
  MyPost post = new MyPost();
  Firebase fire = new Firebase();
  var currentLocation = <String, double>{};
  var location = new Location();
  
  void _submitPost() async{
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      currentLocation = await location.getLocation();
      post.location = currentLocation;
      post.type = widget.type;
      fire.pushData(post.type,post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
        child: new Form(
          autovalidate: true,
          key: formKey,
          child: new ListView(
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Text(
                    'Category',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(16.0),
                  ),
                  new DropdownButton<String>(
                    value: post.category,
                    hint: new Text('Select Category'),
                    isDense: false,
                    items: <String>[
                      'Apartment',
                      'Car',
                      'Service',
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                          value: value, 
                          child: new Text(value)
                        );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        post.category = newValue;
                      });
                    },
                  ),
                ],
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value.isEmpty ? 'Title can\'t be empty' : null,
                onSaved: (val) => post.title = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value.isEmpty ? 'Description can\'t be empty' : null,
                onSaved: (val) => post.description = val,
              ),
              new SwitchListTile(
                  title: new Text(
                    'Follow Me',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  value: post.followme,
                  onChanged: (bool value) {
                    setState(() {
                      post.followme = value;
                      });
                  }),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text(
                      'Upload Photos',
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              new RaisedButton(
                child: new Text(
                  'Submit',
                  style: new TextStyle(fontSize: 20.0),
                ),
                onPressed: () {_submitPost();},
              )
            ],
          ),
        ),
    );
  }
}