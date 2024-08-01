import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/search_page/data/categories.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/feature/search_page/domain/search_page_services.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageState()) {
    on<GetCategories>(_onGetCategories);
    on<GetCategoryOfMeals>(_onGetCategoryOfMeals);
    on<GetSelectedCategory>(_onGetSelectedCategory);
    on<GetSearchWithName>(_onGetSearchWithName);
    on<AddFilteredCategory>(_onAddFilteredCategory);
    on<RemoveFilteredCategory>(_onRemoveFilteredCategory);
    on<GetFilteredCategoriesMeals>(_onGetFilteredCategoriesMeals);
  }

  final SearchPageServices searchPageService = SearchPageServices();

  Future<void> _onGetCategories(
      GetCategories event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final response = await searchPageService.getCategories();
      emit(state.copyWith(categories: response.categories, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGetCategoryOfMeals(
      GetCategoryOfMeals event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final response =
          await searchPageService.getCategoryOfMeals(event.category);
      emit(state.copyWith(categoryOfMeals: response.meals, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGetSelectedCategory(
      GetSelectedCategory event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      emit(state.copyWith(
          selectedCategory: event.selectedCategory, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGetSearchWithName(
      GetSearchWithName event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final response =
          await searchPageService.getSearchWithName(event.mealName);
      emit(state.copyWith(meals: response.meals, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  void _onAddFilteredCategory(
      AddFilteredCategory event, Emitter<SearchPageState> emit) {
    try {
      final List<String> updatedFilteredCategories = List.from(state.filteredCategories)
        ..add(event.category);
      final Map<String, bool> updatedFilteredCategoryStates = Map.from(state.filteredCategoryStates)
        ..[event.category] = true;
      emit(state.copyWith(
        filteredCategories: updatedFilteredCategories,
        filteredCategoryStates: updatedFilteredCategoryStates,
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  void _onRemoveFilteredCategory(
      RemoveFilteredCategory event, Emitter<SearchPageState> emit) {
    try {
      final List<String> updatedFilteredCategories = List.from(state.filteredCategories)
        ..remove(event.category);
      final Map<String, bool> updatedFilteredCategoryStates = Map.from(state.filteredCategoryStates)
        ..[event.category] = false;
      emit(state.copyWith(
        filteredCategories: updatedFilteredCategories,
        filteredCategoryStates: updatedFilteredCategoryStates,
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _onGetFilteredCategoriesMeals(
      GetFilteredCategoriesMeals event, Emitter<SearchPageState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      List<CategoryOfMeals> filteredMeals = [];
      for (var category in state.filteredCategories) {
        final response = await searchPageService.getCategoryOfMeals(category);
        filteredMeals.addAll(response.meals);
      }
      emit(state.copyWith(filteredMeals: filteredMeals, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
