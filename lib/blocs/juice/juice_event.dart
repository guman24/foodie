import 'package:equatable/equatable.dart';

abstract class JuiceEvent extends Equatable {
  const JuiceEvent();
}

class LoadJuiceEvent extends JuiceEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
