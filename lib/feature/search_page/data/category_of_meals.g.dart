// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_of_meals.dart';


CategoryOfMeals _$CategoryOfMealsFromJson(Map<String, dynamic> json) {
  return CategoryOfMeals(
    strMeal: json['strMeal'] as String,
    strMealThumb: json['strMealThumb'] as String,
    idMeal: json['idMeal'] as String,
  );
}

Map<String, dynamic> _$CategoryOfMealsToJson(CategoryOfMeals instance) => <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };

CategoryOfMealsList _$CategoryOfMealsListFromJson(Map<String, dynamic> json) {
  return CategoryOfMealsList(
    meals: (json['meals'] as List<dynamic>)
        .map((e) => _$CategoryOfMealsFromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryOfMealsListToJson(CategoryOfMealsList instance) => <String, dynamic>{
      'meals': instance.meals.map((e) => e.toJson()).toList(),
    };
