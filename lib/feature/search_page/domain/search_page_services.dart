import 'package:dio/dio.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/search_page/data/categories.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/product/network/network_manager.dart';
import 'package:task_app/product/utility/enums/service_path.dart';

class SearchPageServices {
  Dio _dio = Dio();

  Future<CategoryList> getCategories() async {
    return await NetworkManager.instance.dioGet<CategoryList>(
        ServicePath.getCategories.value, CategoryList(categories: []));
  }

  Future<CategoryOfMealsList> getCategoryOfMeals(String category) async {
    return await NetworkManager.instance.dioGet<CategoryOfMealsList>(
        '${ServicePath.getCategoryOfMeals.value}$category',
        CategoryOfMealsList(meals: []));
  }

  Future<MealsResponse> getSearchWithName(String mealName) async {
    return await NetworkManager.instance
        .dioGet('${ServicePath.searchWithName.value}$mealName', MealsResponse(meals: []));
  }
}
