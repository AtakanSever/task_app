part of 'search_page_bloc.dart';

sealed class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends SearchPageEvent {
}

class GetCategoryOfMeals extends SearchPageEvent {
  String category;
  GetCategoryOfMeals({required this.category});
  @override
  List<Object> get props => [category];
}

class GetSelectedCategory extends SearchPageEvent {
  Category selectedCategory;
  GetSelectedCategory({required this.selectedCategory});
  @override
  List<Object> get props => [selectedCategory];
}

class GetSearchWithName extends SearchPageEvent {
  String mealName;
  GetSearchWithName({required this.mealName});
  @override
  List<Object> get props => [mealName];
}
