import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/config/size.dart';
import 'package:foodie/utils/const/colors.dart';

Widget homeHeadWidget(context) {
  SizeConfig().init(context);
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.05,
        vertical: SizeConfig.screenHeight * 0.04),
    child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Hi Rajan",
            style: TextStyle(
                fontFamily: 'robotoLight',
                color: ColorsPalette.blackDark.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Text(
            "Good Morning",
            style: TextStyle(
                fontFamily: 'robotoBold',
                letterSpacing: 1.2,
                fontSize: 25,
                color: ColorsPalette.blackDark.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            onTap: () {
              //  TODO: OPEN OWN PROFILE PAGE
            },
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRaOiPSpnNMC5Edtomff-f4kKRJw-YhXyN6dg&usqp=CAU',
              fit: BoxFit.cover,
            ),
          ),
        )),
  );
}
