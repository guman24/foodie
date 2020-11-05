import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();
}

class LoadFoodEvent extends RecipeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadJuiceEvent extends RecipeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadCookieEvent extends RecipeEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
