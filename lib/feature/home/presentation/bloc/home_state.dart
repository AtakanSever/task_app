part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Meal> meals;
  final bool isLoading;
  final bool hasError;
  final List<MealOfArea> mealsOfArea;

  const HomeState({
    this.meals = const [],
    this.isLoading = false,
    this.hasError = false,
    this.mealsOfArea = const []
  });

  HomeState copyWith({
    List<Meal>? meals,
    List<MealOfArea>? mealsOfArea,
    bool? isLoading,
    bool? hasError,
  }) {
    return HomeState(
      meals: meals ?? this.meals,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      mealsOfArea: mealsOfArea ?? this.mealsOfArea,
    );
  }

  @override
  List<Object> get props => [meals, isLoading, hasError, mealsOfArea];
}
