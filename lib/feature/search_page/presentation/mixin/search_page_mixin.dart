import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/home/presentation/view/home_page.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/search_page/presentation/view/search_page.dart';

mixin SearchPageMixin on State<SearchPage> {
  @override
  void initState() {
    context.read<SearchPageBloc>().add(GetCategories());
    super.initState();
  }

  List<Color> backgroundColors = [
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Colors.cyanAccent,
    Colors.indigo,
    Colors.teal,
    Colors.limeAccent,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.pinkAccent,
    Colors.tealAccent,
  ];
}