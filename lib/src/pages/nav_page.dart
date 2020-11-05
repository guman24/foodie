import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/blocs/connection/internet_bloc.dart';
import 'package:foodie/blocs/connection/internet_event.dart';
import 'package:foodie/blocs/connection/internet_state.dart';
import 'package:foodie/src/pages/home_page.dart';
import 'package:foodie/utils/const/Typograph.dart';
import 'package:foodie/utils/const/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:foodie/utils/config/size.dart';

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
    SizeConfig().init(context);
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
              width: SizeConfig.screenWidth,
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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.02),
                  child: GNav(
                      gap: SizeConfig.screenHeight*0.01,
                      activeColor: ColorsPalette.tealDark,
                      iconSize: SizeConfig.screenHeight*0.04,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05,
                          vertical: SizeConfig.screenHeight * 0.009),
                      duration: Duration(milliseconds: 800),
                      tabBackgroundColor: ColorsPalette.tealGrey,
                      tabs: [
                        GButton(
                            icon: LineIcons.home,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Home',
                            ),
                        GButton(
                            icon: LineIcons.heart_o,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Favourite',
                        ),
                        GButton(
                            icon: LineIcons.location_arrow,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Location',
                           ),
                        GButton(
                            icon: LineIcons.comment_o,
                            iconColor: Typograph.tabBarIconColor,
                            text: 'Message',
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
        return Container();
      },
    );
  }
}
