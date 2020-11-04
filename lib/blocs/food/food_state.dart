import 'package:equatable/equatable.dart';
import 'package:foodie/models/food.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class InitialFoodState extends FoodState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoInterNetState extends FoodState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingFoodState extends FoodState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessFoodState extends FoodState {
  final List<Recipe> foods;

  SuccessFoodState({this.foods});

  @override
  // TODO: implement props
  List<Object> get props => [foods];
}

class FailedFoodState extends FoodState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
