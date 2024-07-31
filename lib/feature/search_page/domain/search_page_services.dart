import 'package:dio/dio.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/search_page/data/categories.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';

class SearchPageServices {
  final Dio _dio = Dio();

  Future<CategoryList> getCategories() async {
    try {
      final response =
          await _dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');

      if (response.statusCode == 200) {
        return CategoryList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Meals could not be brought ');
      }
    } catch (e) {
      throw Exception('Meals could not be brought: $e');
    }
  }

  Future<CategoryOfMealsList> getCategoryOfMeals(String category) async {
    try {
      final response =
          await _dio.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}');

      if (response.statusCode == 200) {
        return CategoryOfMealsList.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Meals could not be brought with category');
      }
    } catch (e) {
      throw Exception('Meals could not be brought with category: $e');
    }
  }

  Future<MealsResponse> getSearchWithName(String mealName) async {
    try {
      final response =
          await _dio.get('https://www.themealdb.com/api/json/v1/1/search.php?s=${mealName}');

      if (response.statusCode == 200) {
        return MealsResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Meals could not be brought with mealName');
      }
    } catch (e) {
      throw Exception('Meals could not be brought with mealName: $e');
    }
  }
}

