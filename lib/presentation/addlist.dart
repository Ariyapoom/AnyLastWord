import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';



class AddList extends StatefulWidget{
  _AddlistState createState() => _AddlistState();
}

class _AddlistState extends State<AddList>{
  var count = 0;
  MyList newlist = new MyList("hello","11/05/21");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new list"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(AppRoutes.home);
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Add"),
          onPressed: (){
            context.bloc<ListCubit>().addlist(newlist);
          },
        ),
      ),
    );
  }
}