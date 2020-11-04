import 'package:bloc/bloc.dart';
import 'package:foodie/apis/service.dart';
import 'package:foodie/blocs/cookie/cookie_event.dart';
import 'package:foodie/blocs/cookie/cookie_state.dart';

class CookieBloc extends Bloc<CookieEvent, CookieState> {
  final apiService = ApiServices();

  CookieBloc() : super(InitialCookieState());

  @override
  Stream<CookieState> mapEventToState(CookieEvent event) async* {
    //  implement mapEventToState
    if (event is LoadCookieEvent) {
      try {
        yield LoadingCookieState();
        final cookieList = await apiService.getCookies();
        yield SuccessCookieState(cookies: cookieList);
      } catch (err) {
        yield FailedCookieState();
      }
    }
  }
}
