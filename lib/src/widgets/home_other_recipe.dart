import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/blocs/recipe/recipe_bloc.dart';
import 'package:foodie/blocs/recipe/recipe_event.dart';
import 'package:foodie/blocs/recipe/recipe_state.dart';
import 'package:foodie/utils/config/size.dart';
import 'package:foodie/utils/const/Typograph.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomeOtherRecipe extends StatefulWidget {
  @override
  _HomeOtherRecipeState createState() => _HomeOtherRecipeState();
}

class _HomeOtherRecipeState extends State<HomeOtherRecipe> {
  RecipeBloc _recipeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recipeBloc = BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(LoadCookieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListTile(
              title: Text("Other Recipes", style: Typograph.semiTitle),
              trailing: IconButton(
                onPressed: () {
                  //  TODO: IMPLEMENT ON PRESSED TO VIEW ALL OTHER RECIPES
                },
                icon: Icon(LineIcons.angle_double_right),
                color: ColorsPalette.tealDark,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeCookieSuccessState) {
                  final cookies = state.cookies;
                  if (cookies.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: ColorsPalette.tealDark,
                      ),
                    );
                  }
                  return Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorsPalette.tealLight,
                                      ColorsPalette.tealDark,
                                    ],
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.02,
                                    vertical: SizeConfig.screenHeight * 0.02),
                              ),
                              Positioned(
                                  left: SizeConfig.screenWidth * 0.1,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                cookies[index].image))),
                                  )),
                              Positioned(
                                left: SizeConfig.screenWidth * 0.4,
                                top: 10,
                                bottom: 10,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: SizeConfig.screenWidth * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 10),
                                        child: Text(
                                          cookies[index].title,
                                          style: TextStyle(
                                              color: ColorsPalette.whiteLight,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Calibri_Normal",
                                              fontSize: 18),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "2.4 mins",
                                            style: TextStyle(
                                                color:
                                                    ColorsPalette.whiteMedium,
                                                fontFamily: "Calibri_Normal",
                                                fontSize: 15),
                                          ),
                                          IconButton(
                                            color: ColorsPalette.whiteLight,
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_forward_ios),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
