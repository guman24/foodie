import 'package:equatable/equatable.dart';
import 'package:foodie/models/food.dart';

abstract class JuiceState extends Equatable {
  const JuiceState();
}

class InitialJuiceState extends JuiceState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingJuiceState extends JuiceState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessJuiceState extends JuiceState {
  final List<Recipe> beers;

  SuccessJuiceState({this.beers});

  @override
  // TODO: implement props
  List<Object> get props => [beers];
}

class FailedJuiceState extends JuiceState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
