import 'package:anylastword/main.dart';
import 'package:anylastword/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ShowListDetail extends StatefulWidget {
  int index;
  ShowListDetail(this.index);
  _ShowListDetail createState() => _ShowListDetail();
}

class _ShowListDetail extends State<ShowListDetail> {
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
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
                          readOnly: true,
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
                        width: 200,
                        child: TextField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          controller: TextEditingController(
                              text: formatter
                                  .format(state[widget.index].listdate)),
                        ),
                      )
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
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
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
                    color: state[widget.index].done ? Colors.green : Colors.red,
                    onPressed: () {
                      state[widget.index].done = true;
                      this.setState(() {});
                    },
                    child: state[widget.index].done
                        ? Text("Done!")
                        : Text("Mark as Done!"),
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    onPressed: () => {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.editlist,
                              arguments: widget.index)
                          .then((value) {
                        if (value == false) {
                          Navigator.pop(context);
                        }
                        this.setState(() {});
                      })
                    },
                    child: Text("Edit"),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Back"),
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
