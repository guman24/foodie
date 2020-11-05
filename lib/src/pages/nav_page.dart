import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/apis/service.dart';
import 'package:foodie/blocs/connection/internet_bloc.dart';
import 'package:foodie/blocs/connection/internet_event.dart';
import 'file:///E:/Flutter%20Projects/foodie/lib/internet_service.dart';
import 'package:foodie/blocs/connection/internet_state.dart';
import 'package:foodie/src/pages/home_page.dart';
import 'package:foodie/utils/const/Typograph.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetBloc>(
      create: (_) => InternetBloc(),
      child: NavPageStateful(),
    );
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

  InternetBloc _internetBloc;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Favourite Page',
      style: optionStyle,
    ),
    Text(
      'Location Page',
      style: optionStyle,
    ),
    Text(
      'Notification Page',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _internetBloc = BlocProvider.of<InternetBloc>(context);
    _internetBloc.add(CheckInternetEvent());
  }

  @override
  Widget build(BuildContext context) {
    // print("****connect $isInternetConnected");
    return BlocBuilder<InternetBloc, InternetState>(
      cubit: _internetBloc,
      builder: (context, state) {
        if (state is LoadingInternetState) {
          return Scaffold(
            backgroundColor: ColorsPalette.tealGrey.withOpacity(0.9),
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: ColorsPalette.tealDark,
              ),
            ),
          );
        }
        if (state is FailedInternetState) {
          return Scaffold(
            backgroundColor: ColorsPalette.tealGrey.withOpacity(0.9),
            body: Center(
              child: Text(
                  "No Internet Connection. Please connect to wifi or data"),
            ),
          );
        }
        if (state is SuccessInternetState) {
          return Scaffold(
            backgroundColor: ColorsPalette.tealGrey.withOpacity(0.9),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: ColorsPalette.whiteLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(.1))
                  ]),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10, bottom: 30),
                  child: GNav(
                      gap: 8,
                      activeColor: ColorsPalette.tealDark,
                      iconSize: 28,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      duration: Duration(milliseconds: 800),
                      tabBackgroundColor: ColorsPalette.tealGrey,
                      tabs: [
                        GButton(
                            icon: LineIcons.home,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Home',
                            textStyle: Typograph.tabBarTitle),
                        GButton(
                            icon: LineIcons.heart_o,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Favourite',
                            textStyle: Typograph.tabBarTitle),
                        GButton(
                            icon: LineIcons.location_arrow,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Location',
                            textStyle: Typograph.tabBarTitle),
                        GButton(
                            icon: LineIcons.bell_o,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Notification',
                            textStyle: Typograph.tabBarTitle),
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
        return Container();
      },
    );
  }
}
