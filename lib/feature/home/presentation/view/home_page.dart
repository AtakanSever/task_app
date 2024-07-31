import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetMealsOfArea());
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              const VerticalSpace.xxSmall(),
              Center(
                child: SvgPicture.asset('assets/images/logo_colorful.svg'),
              ),
              const VerticalSpace.xxSmall(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    color:
                        context.theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                  const HorizontalSpace.xxxSmall(),
                  const Text('Canada, Montreal'),
                ],
              ),
              const VerticalSpace.small(),
              InkWell(
                  onTap: () {
                    context.push('/search_page');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: context.dynamicHeight(0.018),
                        horizontal: context.dynamicWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.theme.colorScheme.onBackground
                          .withOpacity(0.06),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/search_icon.svg'),
                        HorizontalSpace.xSmall(),
                        Text(
                          'Search Store',
                          style: context.textTheme.labelMedium?.copyWith(
                              color: context.theme.colorScheme.onBackground
                                  .withOpacity(0.6)),
                        )
                      ],
                    ),
                  )),
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
                                meals: state.mealsOfArea,
                                isHaveWidget: false),
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