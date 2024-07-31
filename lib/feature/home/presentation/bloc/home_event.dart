part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetMeals extends HomeEvent {
  String mealId;
  GetMeals({required this.mealId});
}

class GetMealsOfArea extends HomeEvent {}
