import 'package:chat_messages/Screens/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Jennah extends StatefulWidget {
  @override
  _JennahState createState() => _JennahState();
}

class _JennahState extends State<Jennah> {
  final usersRefJennah =
      FirebaseFirestore.instance.collection('users').doc('jennah');
  final _jennahkey = GlobalKey<FormState>();

  final usersRefAlizeh = FirebaseFirestore.instance.collection('users');
  TextEditingController jennahController = TextEditingController();
  String secmessage = "Reciever's Message";
  String yourmessage = 'Your Message';

  displayText() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        yourmessage,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  displaymessage2() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        secmessage,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Form(
          key: _jennahkey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                child: displayText(),
              ),
              Container(
                child: displaymessage2(),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                controller: jennahController,
                onSaved: (value) {
                  jennahController.text = value;
                  yourmessage = value;
                },
                // ignore: missing_return
                validator: (String val) {
                  if (val.isEmpty) {
                    return 'Please enter your message';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Message',
                    errorStyle: TextStyle(
                      color: Colors.red[500],
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'Type your message here..'),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('Send'),
                    onPressed: () async {
                      if (_jennahkey.currentState.validate()) {
                        _jennahkey.currentState.save();
                      }
                      setState(() {
                        jennahController.clear();
                      });
                      await Store().sentMessageJennah(yourmessage);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('Recieve'),
                    onPressed: () async {
                      String val = await Store().receveButtonJennah();
                      setState(() {
                        secmessage = val;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
