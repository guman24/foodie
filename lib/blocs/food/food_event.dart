import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class LoadFoodEvent extends FoodEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
