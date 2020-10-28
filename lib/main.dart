import 'package:anylastword/list_observer.dart';
import 'package:anylastword/presentation/addlist.dart';
import 'package:anylastword/presentation/editlist.dart';
import 'package:anylastword/presentation/home.dart';
import 'package:anylastword/presentation/showlist.dart';
import 'package:anylastword/presentation/showlistdetail.dart';
import 'package:anylastword/route/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = ListObserver();
  runApp(MyApp());
}

class MyList {
  String listname;
  String listdetail;
  DateTime listdate;
  bool done = false;
  MyList(this.listname, this.listdate);
}

class ListCubit extends Cubit<List> {
  ListCubit() : super(List());
  int count;
  void addlist(value) => state.add(value);
  void delete(index) => state.removeAt(index);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (context) => Homepage(),
          AppRoutes.addlist: (context) => AddList(),
          AppRoutes.showlist: (context) => ShowList(),
        },
        onGenerateRoute: _routeWithParam,
      ),
    );
  }
}

Route _routeWithParam(RouteSettings settings) {
  if (settings.name == AppRoutes.showdetail) {
    final index = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      return ShowListDetail(index);
    });
  }
  if (settings.name == AppRoutes.editlist) {
    final index = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      return EditList(index);
    });
  }
}
