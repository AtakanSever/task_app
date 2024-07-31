// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_of_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealOfArea _$MealOfAreaFromJson(Map<String, dynamic> json) {
  return MealOfArea(
    idMeal: json['idMeal'] as String,
    strMeal: json['strMeal'] as String,
    strMealThumb: json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$MealOfAreaToJson(MealOfArea instance) => <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
    };

MealsOfAreaResponse _$MealsOfAreaResponseFromJson(Map<String, dynamic> json) {
  return MealsOfAreaResponse(
    meals: (json['meals'] as List<dynamic>)
        .map((e) => MealOfArea.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealsOfAreaResponseToJson(MealsOfAreaResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals.map((e) => e.toJson()).toList(),
    };
