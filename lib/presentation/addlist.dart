import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';

class AddList extends StatefulWidget {
  _AddlistState createState() => _AddlistState();
}

class _AddlistState extends State<AddList> {
  var count = 0;
  MyList newlist = new MyList("Hello", DateTime.now());
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
              Container(
                alignment: Alignment.center,
                width: 250,
                child: TextField(),
              ),
              Container(
                child: RaisedButton(
                  child: Text(newlist.listdate.toString()),
                  onPressed: () async => newlist.listdate =
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2050)),
                  color: Colors.blue,
                ),
              ),
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
