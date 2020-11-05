import 'package:bloc/bloc.dart';
import 'package:foodie/blocs/connection/internet_event.dart';
import 'file:///E:/Flutter%20Projects/foodie/lib/internet_service.dart';
import 'package:foodie/blocs/connection/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InitialInternetState());
  final _internetService = InternetService();

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    // TODO: implement mapEventToState
    if (event is CheckInternetEvent) {
      try {
        yield LoadingInternetState();
        await _internetService.checkConnectivity();
        final isInternet = _internetService.getConnection();
        if (isInternet) {
          yield SuccessInternetState();
        } else {
          yield FailedInternetState();
        }
      } catch (error) {
        yield FailedInternetState();
      }
    }
  }
}
