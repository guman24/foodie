import 'package:flutter/material.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:line_icons/line_icons.dart';

Widget homeOtherRecipeWidget() {
  return Container(
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            title: Text("Other Recipes",style: TextStyle(
              fontFamily: "Adobe_Song",
              color: ColorsPalette.blackDark,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
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
  );
}
