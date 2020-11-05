import 'package:bloc/bloc.dart';
import 'package:foodie/apis/service.dart';
import 'file:///E:/Flutter%20Projects/foodie/lib/internet_service.dart';

import 'package:foodie/blocs/recipe/recipe_event.dart';
import 'package:foodie/blocs/recipe/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final apiService = ApiServices();
  final _internetService = InternetService();

  RecipeBloc() : super(RecipeInitialState());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    //  implement mapEventToState
    await _internetService.checkConnectivity();
    bool isInternetConnect;
    isInternetConnect = _internetService.getConnection();
    if (isInternetConnect) {
      if (event is LoadFoodEvent) {
        try {
          print("***inside bloc:$isInternetConnect");
          yield RecipeLoadingState();
          final foodList = await apiService.getFoods();
          yield RecipeFoodSuccessState(foods: foodList);
        } catch (err) {
          yield RecipeFoodFailedState(error: err.toString());
        }
      } else if (event is LoadCookieEvent) {
        try {
          yield RecipeLoadingState();
          final cookieList = await apiService.getCookies();
          yield RecipeCookieSuccessState(cookies: cookieList);
        } catch (err) {
          yield RecipeCookieFailedState();
        }
      } else if (event is LoadJuiceEvent) {
        try {
          yield RecipeLoadingState();
          final juiceList = await apiService.getJuices();
          yield RecipeJuiceSuccessState(juices: juiceList);
        } catch (err) {
          yield RecipeJuiceFailedState();
        }
      }
    }
  }
}
