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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Card(
              child:ListTile(
              title: Text("Home"),
            ) ,
            )
          ],
        ),
      ),
      body: Center(child: Text("Trash For Fun"),),
    );
  }
}