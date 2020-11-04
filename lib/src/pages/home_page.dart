import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/src/widgets/home_flash_food.dart';
import 'package:foodie/src/widgets/home_head.dart';
import 'package:foodie/utils/config/size.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:line_icons/line_icons.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        // height: SizeConfig.screenHeight,
        //   width: SizeConfig.screenWidth,
        child: Column(
      children: [
        Expanded(flex: 0, child: homeHeadWidget(context)),
        Expanded(flex: 2, child: homeFlashFoodWidget()),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: Text("Other Recipes"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.angle_double_right),
                      color: ColorsPalette.tealDark,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 40,
                              width: 50,
                              color: Colors.green,
                              margin: EdgeInsets.all(10),
                              child: Text(index.toString()));
                        }),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
