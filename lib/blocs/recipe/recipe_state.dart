import 'package:equatable/equatable.dart';
import 'package:foodie/models/recipe.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();
}

class RecipeInitialState extends RecipeState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RecipeLoadingState extends RecipeState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RecipeFoodSuccessState extends RecipeState {
  final List<Recipe> foods;

  RecipeFoodSuccessState({this.foods});

  @override
  // TODO: implement props
  List<Object> get props => [foods];
}

class RecipeJuiceSuccessState extends RecipeState {
  final List<Recipe> juices;

  RecipeJuiceSuccessState({this.juices});

  @override
  // TODO: implement props
  List<Object> get props => [juices];
}

class RecipeCookieSuccessState extends RecipeState {
  final List<Recipe> cookies;

  RecipeCookieSuccessState({this.cookies});

  @override
  // TODO: implement props
  List<Object> get props => [cookies];
}

class RecipeFoodFailedState extends RecipeState {
  final String error;

  RecipeFoodFailedState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RecipeJuiceFailedState extends RecipeState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RecipeCookieFailedState extends RecipeState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
