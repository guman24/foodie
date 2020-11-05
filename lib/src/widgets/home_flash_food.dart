import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/blocs/recipe/recipe_bloc.dart';
import 'package:foodie/blocs/recipe/recipe_event.dart';
import 'package:foodie/blocs/recipe/recipe_state.dart';
import 'package:foodie/utils/config/size.dart';
import 'package:foodie/utils/const/Typograph.dart';
import 'package:foodie/utils/const/circle_indicator.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomeFlashSection extends StatefulWidget {
  @override
  _HomeFlashSectionState createState() => _HomeFlashSectionState();
}

class _HomeFlashSectionState extends State<HomeFlashSection> {
  RecipeBloc _recipeBloc,recipeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recipeBloc= BlocProvider.of<RecipeBloc>(context);
    recipeBloc= BlocProvider.of<RecipeBloc>(context);
    _recipeBloc.add(LoadFoodEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RotatedBox(
      quarterTurns: 3,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: TabBar(
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(vertical: 15),
                  labelColor: ColorsPalette.blackDark,
                  labelStyle: Typograph.semiTitle,
                  unselectedLabelColor: ColorsPalette.tealDark.withOpacity(0.5),
                  indicator: CircleTabIndicator(
                      color: ColorsPalette.tealDark, radius: 5),
                  isScrollable: false,
                  tabs: [
                    Text(
                      "Recommended",
                    ),
                    Text(
                      "Todays Recipe",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: TabBarView(
                  children: [
                    BlocBuilder<RecipeBloc, RecipeState>(
                      cubit: _recipeBloc,
                      builder: (context, state) {
                        if (state is RecipeFoodSuccessState) {
                          final foods = state.foods;
                          if (foods == null) {
                            return CircularProgressIndicator();
                          }
                          return ListView.builder(
                              itemCount: foods.length,
                              itemBuilder: (context, index) {
                                return RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    width: SizeConfig.screenWidth * 0.5,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorsPalette.greyMedium,
                                              offset: Offset(0, 2),
                                              blurRadius: 6.0)
                                        ]),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: ShaderMask(
                                            blendMode: BlendMode.darken,
                                            shaderCallback: (bounds) {
                                              return LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    ColorsPalette.blackDark
                                                        .withOpacity(0.8)
                                                  ]).createShader(Rect.fromLTRB(
                                                  0,
                                                  SizeConfig.screenWidth * 0.4,
                                                  bounds.width,
                                                  bounds.height));
                                            },
                                            child: Image.network(
                                              foods[index].image,
                                              fit: BoxFit.cover,
                                              height:
                                                  SizeConfig.screenHeight * 0.5,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.02,
                                          left: SizeConfig.screenWidth * 0.05,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: ColorsPalette.tealDark),
                                            child: Text(
                                              "Food",
                                              style: TextStyle(
                                                  color:
                                                      ColorsPalette.whiteMedium,
                                                  fontFamily: "Caribri_Normal",
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.32,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              foods[index].title,
                                              style: TextStyle(
                                                  fontFamily: "Calibri_Normal",
                                                  fontSize: 18,
                                                  color:
                                                      ColorsPalette.whiteLight),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.4,
                                          left: SizeConfig.screenWidth * 0.05,
                                          right: 0,
                                          bottom: 0,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  LineIcons.star,
                                                  color:
                                                      ColorsPalette.whiteLight,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    "(35) Reviews",
                                                    style: TextStyle(
                                                        color: ColorsPalette
                                                            .whiteLight
                                                            .withOpacity(0.6),
                                                        fontFamily:
                                                            "Calibri_Normal"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                        return Container();
                      },
                    ),
                    BlocBuilder<RecipeBloc, RecipeState>(
                      cubit: recipeBloc,
                      builder: (context, state) {
                        if(state is RecipeFoodFailedState){
                          print("****internet errror:${state.error}");
                        }
                        if (state is RecipeFoodSuccessState) {
                          final foods = state.foods;
                          if(foods.isEmpty){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              itemCount: foods.length,
                              itemBuilder: (context, index) {
                                return RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    width: SizeConfig.screenWidth * 0.5,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorsPalette.greyMedium,
                                              offset: Offset(0, 2),
                                              blurRadius: 6.0)
                                        ]),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: ShaderMask(
                                            blendMode: BlendMode.darken,
                                            shaderCallback: (bounds) {
                                              return LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    ColorsPalette.blackDark
                                                        .withOpacity(0.8)
                                                  ]).createShader(Rect.fromLTRB(
                                                  0,
                                                  SizeConfig.screenWidth * 0.4,
                                                  bounds.width,
                                                  bounds.height));
                                            },
                                            child: Image.network(
                                              foods[index].image,
                                              fit: BoxFit.cover,
                                              height:
                                                  SizeConfig.screenHeight * 0.5,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.02,
                                          left: SizeConfig.screenWidth * 0.05,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: ColorsPalette.tealDark),
                                            child: Text(
                                              "Food",
                                              style: TextStyle(
                                                  color:
                                                      ColorsPalette.whiteMedium,
                                                  fontFamily: "Caribri_Normal",
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.32,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              foods[index].title,
                                              style: TextStyle(
                                                  fontFamily: "Calibri_Normal",
                                                  fontSize: 18,
                                                  color:
                                                      ColorsPalette.whiteLight),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: SizeConfig.screenHeight * 0.4,
                                          left: SizeConfig.screenWidth * 0.05,
                                          right: 0,
                                          bottom: 0,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  LineIcons.star,
                                                  color:
                                                      ColorsPalette.whiteLight,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    "(35) Reviews",
                                                    style: TextStyle(
                                                        color: ColorsPalette
                                                            .whiteLight
                                                            .withOpacity(0.6),
                                                        fontFamily:
                                                            "Calibri_Normal"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                        return Container();
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
