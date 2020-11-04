import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/const/circle_indicator.dart';
import 'package:foodie/utils/const/colors.dart';

Widget homeFlashFoodWidget() {
  return Container(
      child: RotatedBox(
    quarterTurns: 3,
    child: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: TabBar(
              indicatorWeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.symmetric(vertical: 15),
              labelColor: ColorsPalette.blackDark,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              unselectedLabelColor: ColorsPalette.blackDark.withOpacity(0.5),
              indicator:
                  CircleTabIndicator(color: ColorsPalette.tealDark, radius: 5),
              isScrollable: false,
              tabs: [
                Text(
                  "Todays Recipe",
                ),
                Text(
                  "Recommended",
                ),
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 100,
                            height: 100,
                            color: Colors.red,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(index.toString())));
                      }),
                  Text("2")
                ],
              ))
        ],
      ),
    ),
  ));
}
