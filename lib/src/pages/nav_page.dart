import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/src/pages/home_page.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavPageStateful();
  }
}

class NavPageStateful extends StatefulWidget {
  @override
  _NavPageStatefulState createState() => _NavPageStatefulState();
}

class _NavPageStatefulState extends State<NavPageStateful> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.tealGrey.withOpacity(0.9),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: ColorsPalette.whiteLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right:15.0,top: 10,bottom: 30),
            child: GNav(
                gap: 8,
                activeColor: ColorsPalette.tealLight,
                iconSize: 28,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: ColorsPalette.tealGrey,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconColor: ColorsPalette.tealLight.withOpacity(0.5),
                    text: 'Home',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorsPalette.tealLight
                    ),
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    iconColor: ColorsPalette.tealLight.withOpacity(0.5),
                    text: 'Favourite',
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsPalette.tealLight
                    ),
                  ),
                  GButton(
                    icon: LineIcons.location_arrow,
                    iconColor: ColorsPalette.tealLight.withOpacity(0.5),
                    text: 'Location',
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsPalette.tealLight
                    ),
                  ),
                  GButton(
                    icon: LineIcons.bell_o,
                    iconColor: ColorsPalette.tealLight.withOpacity(0.5),
                    text: 'Notification',
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsPalette.tealLight
                    ),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

}
