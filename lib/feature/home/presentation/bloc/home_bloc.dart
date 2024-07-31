import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/home/data/models/meal_of_area.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/home/domain/services/meals_get_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetMeals>(_onGetMeals);
    on<GetMealsOfArea>(_onGetMealsOfArea);
  }

  final MealService mealService = MealService();
  Future<void> _onGetMeals(GetMeals event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final response = await mealService.getMealsById(event.mealId);
      emit(state.copyWith(meals: response.meals, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGetMealsOfArea(
      GetMealsOfArea event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final response = await mealService.getMealsOfArea();
      emit(state.copyWith(mealsOfArea: response.meals, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
