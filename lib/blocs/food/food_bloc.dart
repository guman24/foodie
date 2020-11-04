import 'package:bloc/bloc.dart';
import 'package:foodie/apis/service.dart';
import 'package:foodie/blocs/food/food_event.dart';

import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final apiService = ApiServices();

  FoodBloc() : super(InitialFoodState());

  @override
  Stream<FoodState> mapEventToState(FoodEvent event) async* {
    //  implement mapEventToState
    if (event is LoadFoodEvent) {
      try {
        yield LoadingFoodState();
        final foodList = await apiService.getFoods();
        yield SuccessFoodState(foods: foodList);
      } catch (err) {
        yield FailedFoodState();
      }
    }
  }
}
