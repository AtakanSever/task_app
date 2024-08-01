part of 'search_page_bloc.dart';

class SearchPageState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final List<Category> categories;
  final List<CategoryOfMeals> categoryOfMeals;
  final List<Meal> meals;
  final List<CategoryOfMeals> filteredMeals;
  final Category? selectedCategory;
  final List<String> filteredCategories;
  final Map<String, bool> filteredCategoryStates;

  const SearchPageState({
    this.isLoading = false,
    this.hasError = false,
    this.categories = const [],
    this.categoryOfMeals = const [],
    this.meals = const [],
    this.filteredMeals = const [],
    this.selectedCategory,
    this.filteredCategories = const [],
    this.filteredCategoryStates = const {},
  });

  SearchPageState copyWith({
    bool? isLoading,
    bool? hasError,
    List<Category>? categories,
    List<CategoryOfMeals>? categoryOfMeals,
    List<Meal>? meals,
    List<CategoryOfMeals>? filteredMeals,
    Category? selectedCategory,
    List<String>? filteredCategories,
    Map<String, bool>? filteredCategoryStates,
  }) {
    return SearchPageState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      categories: categories ?? this.categories,
      categoryOfMeals: categoryOfMeals ?? this.categoryOfMeals,
      meals: meals ?? this.meals,
      filteredMeals: filteredMeals ?? this.filteredMeals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      filteredCategoryStates: filteredCategoryStates ?? this.filteredCategoryStates,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        hasError,
        categories,
        categoryOfMeals,
        meals,
        filteredMeals,
        selectedCategory,
        filteredCategories,
        filteredCategoryStates,
      ];
}
