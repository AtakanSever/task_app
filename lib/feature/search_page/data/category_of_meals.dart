import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/product/core/t_types/meal_t_model.dart';

part 'category_of_meals.g.dart';

@JsonSerializable()
class CategoryOfMeals implements MealItem {
  @JsonKey(name: 'strMeal')
  final String strMeal;

  @JsonKey(name: 'strMealThumb')
  final String strMealThumb;

  @JsonKey(name: 'idMeal')
  final String idMeal;

  CategoryOfMeals({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory CategoryOfMeals.fromJson(Map<String, dynamic> json) => _$CategoryOfMealsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfMealsToJson(this);
}

@JsonSerializable()
class CategoryOfMealsList {
  @JsonKey(name: 'meals')
  final List<CategoryOfMeals> meals;

  CategoryOfMealsList({required this.meals});

  factory CategoryOfMealsList.fromJson(Map<String, dynamic> json) => _$CategoryOfMealsListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfMealsListToJson(this);
}
