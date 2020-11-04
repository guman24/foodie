import 'package:equatable/equatable.dart';
import 'package:foodie/models/food.dart';

abstract class CookieState extends Equatable {
  const CookieState();
}

class InitialCookieState extends CookieState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadingCookieState extends CookieState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SuccessCookieState extends CookieState {
  final List<Recipe> cookies;

  SuccessCookieState({this.cookies});

  @override
  // TODO: implement props
  List<Object> get props => [cookies];
}

class FailedCookieState extends CookieState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
