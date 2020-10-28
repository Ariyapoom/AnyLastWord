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
    setState(() {
      if (newlist.listdate == null) {
        newlist.listdate = DateTime.now();
      }
    });
  }

  MyList newlist = new MyList(" ", DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Add new list"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("What do you want to do?!!"),
              Container(
                alignment: Alignment.center,
                width: 250,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (text) => {newlist.listname = text},
                ),
              ),
              Text("Give More Detail For That"),
              Container(
                alignment: Alignment.center,
                width: 250,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (text) => {newlist.listdetail = text},
                ),
              ),
              Text("So, When ??"),
              Container(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: Text(formatter.format(newlist.listdate)),
                  onPressed: () => setdate(),
                  color: Colors.blueAccent,
                ),
              ),
              Text("Are you sure ?!!"),
              Container(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  onPressed: () {
                    this.setState(() {
                      context.bloc<ListCubit>().addlist(newlist);
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }
}
