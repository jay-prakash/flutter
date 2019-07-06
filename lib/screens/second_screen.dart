import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String data = 'back from second screen';
  @override
  void dispose() {
    // TODO: implement dispose
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context, data);
            },
            child: Text('Go to home screen'),
          ),
        ),
      )),
    );
  }
}
