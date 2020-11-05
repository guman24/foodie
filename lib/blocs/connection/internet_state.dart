import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable{
  const InternetState();
}
class InitialInternetState extends InternetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class LoadingInternetState extends InternetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class SuccessInternetState extends InternetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class FailedInternetState extends InternetState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}