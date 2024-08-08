import 'package:dio/dio.dart';
import 'package:task_app/feature/home/data/models/meal_of_area.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/product/network/network_manager.dart';
import 'package:task_app/product/utility/enums/service_path.dart';

class MealService {

  Future<MealsResponse> getMealsById(String Id) async {
    return await NetworkManager.instance.dioGet<MealsResponse>(
        '${ServicePath.mealsById.value}$Id', MealsResponse(meals: []));
  }

  Future<MealsOfAreaResponse?> getMealsOfArea() async {
    return await NetworkManager.instance.dioGet<MealsOfAreaResponse>(
      ServicePath.categoryOfArea.value,
      MealsOfAreaResponse(meals: []),
    );
  }
}
