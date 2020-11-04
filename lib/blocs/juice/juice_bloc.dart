import 'package:bloc/bloc.dart';
import 'package:foodie/apis/service.dart';
import 'package:foodie/blocs/juice/juice_event.dart';
import 'package:foodie/blocs/juice/juice_state.dart';

class CookieBloc extends Bloc<JuiceEvent, JuiceState> {
  final apiService = ApiServices();

  CookieBloc() : super(InitialJuiceState());

  @override
  Stream<JuiceState> mapEventToState(JuiceEvent event) async* {
    //  implement mapEventToState
    if (event is LoadJuiceEvent) {
      try {
        yield LoadingJuiceState();
        final beerList = await apiService.getJuices();
        yield SuccessJuiceState(beers: beerList);
      } catch (err) {
        yield FailedJuiceState();
      }
    }
  }
}
