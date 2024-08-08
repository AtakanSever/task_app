import 'package:flutter/material.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/product/extensions/context_extensions.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(25)),
          child: Image.network(
            meal.strMealThumb,
            fit: BoxFit.cover,
            height: context.height > 900 ? 400 : 300,
            width: context.width,
          ),
        ),
        Positioned(
          top: context.height > 900 ? 45 : 30,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 25),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.share, size: 25),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}