import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class ShowList extends StatefulWidget {
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  List<MyList> today ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All list"),
      ),
      body: Container(
        child: BlocBuilder<ListCubit, List>(
          builder: (context, state) {
            state.forEach((i) => {
              if (i.listdate == DateTime.now()) {
                 today.add(i)
              }
            });
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: today.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(today[index].listname),
                    trailing: Text(today[index].listdate.toString()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
