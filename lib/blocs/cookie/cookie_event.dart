import 'package:equatable/equatable.dart';

abstract class CookieEvent extends Equatable {
  const CookieEvent();
}

class LoadCookieEvent extends CookieEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
