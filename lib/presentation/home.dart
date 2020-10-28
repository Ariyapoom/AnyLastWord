import 'package:anylastword/main.dart';
import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  List<int> today = [];
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
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
                  Navigator.of(context)
                      .pushNamed(AppRoutes.showlist)
                      .then((onValue) => {
                            this.setState(() {
                              this.today = [];
                            })
                          });
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Add new list"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .pushNamed(AppRoutes.addlist)
                      .then((data) => {
                            this.setState(() {
                              this.today = [];
                            })
                          });
                },
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: BlocBuilder<ListCubit, List>(
          builder: (context, state) {
            state.forEach((i) => {
                  if (this.formatter.format(i.listdate) ==
                      formatter.format(DateTime.now()))
                    {today.add(state.indexOf(i))}
                });
            return Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    alignment: Alignment.center,
                    child: Text(
                      "Today you must do",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                Column(
                  children: <Widget>[
                    for (var list in state)
                      if (this.formatter.format(list.listdate) ==
                          formatter.format(DateTime.now()))
                        Card(
                          color: list.done ? Colors.green : Colors.red,
                          child: ListTile(
                            title: Text(list.listname),
                            trailing: Text(formatter.format(list.listdate)),
                            onTap: () => {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.showdetail,
                                      arguments: state.indexOf(list))
                                  .then((value) => this.setState(() {
                                        this.today = [];
                                      }))
                            },
                          ),
                        )
                  ],
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).pushNamed(AppRoutes.addlist).then((data) => {
                  this.setState(() {
                    this.today = [];
                  })
                }),
      ),
    );
  }
}
