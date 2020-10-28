import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class EditList extends StatefulWidget {
  int index;
  EditList(this.index);
  _EditList createState() => _EditList();
}

class _EditList extends State<EditList> {
  setdate(state) async {
    state[widget.index].listdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));
    setState(() {
      if (state[widget.index].listdate == null) {
        state[widget.index].listdate = DateTime.now();
      }
    });
  }

  dialogDetail(state) {}
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocBuilder<ListCubit, List>(builder: (context, state) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Task :       "),
                      Container(
                        width: 200,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            state[widget.index].listname = value;
                          },
                          controller: TextEditingController(
                              text: state[widget.index].listname),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Text(""),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date :       "),
                      Container(
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                          child: Text(
                              formatter.format(state[widget.index].listdate)),
                          onPressed: () {
                            setdate(state);
                          },
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Detail :       "),
                          Container(
                            width: 200,
                            child: RaisedButton(
                              onPressed: () async {
                                await showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      title: Text("Edit Detail"),
                                      content: TextField(
                                        controller: TextEditingController(
                                            text:
                                                state[widget.index].listdetail),
                                        onChanged: (value) {
                                          state[widget.index].listdetail =
                                              value;
                                        },
                                      ),
                                      actions: [
                                        RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Okay!"),
                                            color: Colors.green),
                                        RaisedButton(
                                          onPressed: () {
                                            state[widget.index].listdetail =
                                                state[widget.index].listdetail;
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancle"),
                                          color: Colors.red,
                                        )
                                      ],
                                    ));
                                this.setState(() {});
                              },
                              child: Text("Edit Detail"),
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey,
                        height: 125,
                        width: 250,
                        child: Text(
                          state[widget.index].listdetail,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Update!"),
                      color: Colors.green),
                  RaisedButton(
                    onPressed: () {
                      state[widget.index].done = !state[widget.index].done;
                      this.setState(() {});
                    },
                    child: state[widget.index].done
                        ? Text("Reset to Undone")
                        : Text("Set to done"),
                    color: state[widget.index].done ? Colors.green : Colors.red,
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.bloc<ListCubit>().delete(widget.index);
                      Navigator.pop(context, false);
                    },
                    child: Text("Delete"),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
