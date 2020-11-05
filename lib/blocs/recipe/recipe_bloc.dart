import 'package:bloc/bloc.dart';
import 'package:foodie/apis/service.dart';

import 'package:foodie/blocs/recipe/recipe_event.dart';
import 'package:foodie/blocs/recipe/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final apiService = ApiServices();

  RecipeBloc() : super(RecipeInitialState());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    //  implement mapEventToState
    if (event is LoadFoodEvent) {
      try {
        yield RecipeLoadingState();
        final foodList = await apiService.getFoods();
        yield RecipeFoodSuccessState(foods: foodList);
      } catch (err) {
        yield RecipeFoodFailedState();
      }
    }
    else if (event is LoadCookieEvent) {
      try {
        yield RecipeLoadingState();
        final cookieList = await apiService.getCookies();
        yield RecipeCookieSuccessState(cookies: cookieList);
      } catch (err) {
        yield RecipeCookieFailedState();
      }
    }
    else if (event is LoadJuiceEvent) {
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
