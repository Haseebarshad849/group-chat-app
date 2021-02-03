import 'package:chat_messages/Screens/store.dart';
import 'package:flutter/material.dart';

class Alizeh extends StatefulWidget {
  @override
  _AlizehState createState() => _AlizehState();
}

class _AlizehState extends State<Alizeh> {
  TextEditingController alizehController = TextEditingController();

  String secmessage = 'Reciever Message Here';
  String yourmessage = '';
  final _alizehkey = GlobalKey<FormState>();

  displaymessage() {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _alizehkey,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              child: displaymessage(),
            ),
            Container(
              child: displaymessage2(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              // ignore: missing_return
              validator: (String val) {
                if (val.isEmpty) {
                  return "Please enter you message";
                }
              },
              onSaved: (value) {
                yourmessage = value;
                alizehController.text = value;
              },
              controller: alizehController,
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
                  textColor: Colors.white,
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  onPressed: () async {
                    if (_alizehkey.currentState.validate()) {
                      _alizehkey.currentState.save();
                      setState(() {
                        alizehController.clear();
                      });
                    }
                    await Store().sentMessageAlizeh(yourmessage);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: RaisedButton(
                  color: Colors.cyan,
                  textColor: Colors.white,
                  child: Text(
                    'Recieve',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  onPressed: () async {
                    String val = await Store().receveButtonAlizeh();
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
    );
  }
}