import 'package:chat_messages/Screens/alizeh.dart';
import 'package:chat_messages/Screens/jennah.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a User'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              //BUTTON JENNAH
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Jennah',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  color: Colors.cyan,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Jennah(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              //BUTTON ALIZEH
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Alizeh',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  color: Colors.cyan,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Alizeh(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
