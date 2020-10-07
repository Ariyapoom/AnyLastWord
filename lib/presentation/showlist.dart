
import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class ShowList extends StatefulWidget {
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All list"),
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
      body: Container(
        child:BlocBuilder<ListCubit,List>(builder: (context,state){
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                child: ListTile(
                  title: Text(state[index].listname),
                ),
              );
            },
          );
        },) ,
      ),
    );
  }
}
