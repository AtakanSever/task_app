import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/product/core/t_types/meal_t_model.dart';
import 'package:task_app/product/network/base/base_model.dart';

part 'meal_of_area.g.dart';

@JsonSerializable()
class MealOfArea extends MealItem implements BaseModel {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  MealOfArea({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory MealOfArea.fromJson(Map<String, dynamic> json) => _$MealOfAreaFromJson(json);

  Map<String, dynamic> toJson() => _$MealOfAreaToJson(this);
  
  @override
  MealOfArea fromJson(Map<String, dynamic> json) {
    return _$MealOfAreaFromJson(json);
  }
}

@JsonSerializable()
class MealsOfAreaResponse implements BaseModel<MealsOfAreaResponse> {
  final List<MealOfArea> meals;

  MealsOfAreaResponse({required this.meals});

  factory MealsOfAreaResponse.fromJson(Map<String, dynamic> json) => _$MealsOfAreaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsOfAreaResponseToJson(this);

  @override
  MealsOfAreaResponse fromJson(Map<String, dynamic> json) {
    return MealsOfAreaResponse.fromJson(json);
  }
}
