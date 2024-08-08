import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/home/presentation/view/home_page.dart';

mixin HomeMixin on State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetMealsOfArea());
  }

  // carousel images list
  List<Widget> carouselImages = [
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8I4VBWr15750IPFIMIoenlUdPwOVmOhm9Sw&s',
        fit: BoxFit.contain,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        'https://www.busybudgeter.com/wp-content/uploads/2020/02/Easy-Meals-Facebook.jpg',
        fit: BoxFit.contain,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        'https://assets.clevelandclinic.org/transform/a35aef83-8f90-4738-8ced-fee64e4ed789/meal-Prepping-Food-Containers-1271087035-967x544-1_jpg',
        fit: BoxFit.contain,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        'https://meals-on-wheels.com/wp-content/uploads/2020/11/MOWDayOne10.24.190127-Greek-Chicken-Pas-scaled-1.jpg',
        fit: BoxFit.contain,
      ),
    )
  ];
}