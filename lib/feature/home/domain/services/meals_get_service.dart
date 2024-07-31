import 'package:dio/dio.dart';
import 'package:task_app/feature/home/data/models/meal_of_area.dart';
import 'package:task_app/feature/home/data/models/meals.dart';

class MealService {
  final Dio _dio = Dio();

  Future<MealsResponse> getMealsById(String Id) async {
    try {
      final response =
          await _dio.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=${Id}');

      if (response.statusCode == 200) {
        return MealsResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Meals could not be brought');
      }
    } catch (e) {
      throw Exception('Meals could not be brought: $e');
    }
  }

  Future<MealsOfAreaResponse> getMealsOfArea() async {
    try {
      final response = await _dio.get('https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian');

      if (response.statusCode == 200) {
        return MealsOfAreaResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Meals could not be brought');
      }
    } catch (e) {
      throw Exception('Meals could not be brought: $e');
    }
  }
}

