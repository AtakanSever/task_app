import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task_app/product/extensions/context_extensions.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    required this.items,
    required this.autoPlay,
    super.key,
    this.onPageChanged,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
  });

  final List<Widget> items;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.items,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
            autoPlayInterval: widget.autoPlayInterval,
            enlargeCenterPage: true,
            autoPlay: widget.autoPlay,
            height: context.dynamicHeight(0.2),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(index, reason);
              }
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.surface,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}