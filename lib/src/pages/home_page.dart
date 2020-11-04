import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/blocs/cookie/cookie_bloc.dart';
import 'package:foodie/blocs/food/food_bloc.dart';
import 'package:foodie/src/widgets/home_flash_food.dart';
import 'package:foodie/src/widgets/home_head.dart';
import 'package:foodie/src/widgets/home_other_recipe.dart';
import 'package:foodie/utils/config/size.dart';
import 'package:foodie/utils/const/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomepageStateful();
  }
}

class HomepageStateful extends StatefulWidget {
  @override
  _HomepageStatefulState createState() => _HomepageStatefulState();
}

class _HomepageStatefulState extends State<HomepageStateful> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        child: Column(
      children: [
        Expanded(flex: 0, child: homeHeadWidget(context)),
        Expanded(
            flex: 2,
            child: MultiBlocProvider(providers: [
              BlocProvider<FoodBloc>(
                create: (_) => FoodBloc(),
              ),
              BlocProvider<CookieBloc>(
                create: (_) => CookieBloc(),
              )
            ], child: HomeFlashSection())),
        Expanded(flex: 1, child: homeOtherRecipeWidget())
      ],
    ));
  }
}
