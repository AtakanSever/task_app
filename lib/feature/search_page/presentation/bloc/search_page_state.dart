part of 'search_page_bloc.dart';

class SearchPageState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final List<Category> categories;
  final List<CategoryOfMeals> categoryOfMeals;
  final List<Meal> meals; 
  final Category? selectedCategory;

  const SearchPageState({
    this.isLoading = false,
    this.hasError = false,
    this.categories = const [],
    this.categoryOfMeals = const [],
    this.meals = const [], 
    this.selectedCategory,
  });

  SearchPageState copyWith({
    bool? isLoading,
    bool? hasError,
    List<Category>? categories,
    List<CategoryOfMeals>? categoryOfMeals,
    List<Meal>? meals, 
    Category? selectedCategory,
  }) {
    return SearchPageState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      categories: categories ?? this.categories,
      categoryOfMeals: categoryOfMeals ?? this.categoryOfMeals,
      meals: meals ?? this.meals, 
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, categories, categoryOfMeals, meals, selectedCategory];
}
