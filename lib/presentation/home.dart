import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
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
                child: ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Show all list"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AppRoutes.showlist);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Add new list"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AppRoutes.addlist);
                  },
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: [],
          ),
        ));
  }
}
