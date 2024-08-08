import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/home/presentation/mixin/home_mixin.dart';
import 'package:task_app/feature/home/presentation/widget/location_and_sybol_widget.dart';
import 'package:task_app/feature/home/presentation/widget/search_area_widget.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';
import 'package:task_app/feature/home/data/models/meal_of_area.dart';
import 'package:task_app/product/widget/list/gridview_list.dart';
import 'package:task_app/product/widget/slider/carousel_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              LocationAndSymbolWidget(),
              SearchAreaWidget(),
              const VerticalSpace.small(),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state.hasError) {
                      return Center(child: Text('Failed to load meals'));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            CarouselSliderWidget(
                                items: carouselImages, autoPlay: true),
                            VerticalSpace.xSmall(),
                            CustomGridViewList<MealOfArea>(
                                meals: state.mealsOfArea, isHaveWidget: false),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
