import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class ShowList extends StatefulWidget {
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  List<MyList> today = [];
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All list"),
      ),
      body: Container(
        child: BlocBuilder<ListCubit, List>(
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: state[index].done ? Colors.green : Colors.red,
                  child: ListTile(
                      title: Text(state[index].listname),
                      trailing: Text(formatter.format(state[index].listdate)),
                      onTap: () => {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.showdetail,
                                    arguments: index)
                                .then((value) => this.setState(() {
                                      this.today = [];
                                    }))
                          }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
