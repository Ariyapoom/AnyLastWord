import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Any Last Word"),
        leading: RaisedButton(
          child: Icon(Icons.menu),
          onPressed: (){},
          color: Colors.blue,
        ),

      ),
    );
  }
}