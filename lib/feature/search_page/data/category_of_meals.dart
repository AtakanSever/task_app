import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/product/core/t_types/meal_t_model.dart';
import 'package:task_app/product/network/base/base_model.dart';

part 'category_of_meals.g.dart';

@JsonSerializable()
class CategoryOfMeals extends MealItem implements BaseModel {
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
  
  @override
  CategoryOfMeals fromJson(Map<String, dynamic> json) {
    return CategoryOfMeals.fromJson(json);
  }
}

@JsonSerializable()
class CategoryOfMealsList extends BaseModel{
  @JsonKey(name: 'meals')
  final List<CategoryOfMeals> meals;

  CategoryOfMealsList({required this.meals});

  factory CategoryOfMealsList.fromJson(Map<String, dynamic> json) => _$CategoryOfMealsListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfMealsListToJson(this);
  
  @override
  CategoryOfMealsList fromJson(Map<String, dynamic> json) {
    return CategoryOfMealsList.fromJson(json);
  }
}
