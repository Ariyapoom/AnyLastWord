import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import 'package:intl/intl.dart';

class AddList extends StatefulWidget {
  _AddlistState createState() => _AddlistState();
}

class _AddlistState extends State<AddList> {
  var count = 0;

  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  setdate() async {
    newlist.listdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));
    setState(() {});
  }

  MyList newlist = new MyList(" ", DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new list"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("What you want to do?!!"),
              Container(
                alignment: Alignment.center,
                width: 250,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (text) => {newlist.listname = text},
                ),
              ),
              Text("So, When ??"),
              Container(
                child: RaisedButton(
                  child: Text(formatter.format(newlist.listdate)),
                  onPressed: () => setdate(),
                  color: Colors.blue,
                ),
              ),
              Text("Are you sure ?!!"),
              Container(
                child: RaisedButton(
                  onPressed: () => context.bloc<ListCubit>().addlist(newlist),
                  child: Text("Add"),
                ),
              )
            ],
          ),
        ));
  }
}
