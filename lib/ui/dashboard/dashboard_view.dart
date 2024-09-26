import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showgo_travels/ui/contact/contact_view.dart';
import 'package:showgo_travels/ui/services/services_view.dart';

import '../../data/assets.dart';
import '../../utils/color_constants.dart';
import '../../utils/style.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  DashboardView({super.key});

  List<Widget> menu = [
    Text("Home", style: Style.appBarMenuStyle()),
    const SizedBox(width: 30),
    Text("About", style: Style.appBarMenuStyle()),
    const SizedBox(width: 30),
    Text("Trip", style: Style.appBarMenuStyle()),
    const SizedBox(width: 30),
    Text("Explore", style: Style.appBarMenuStyle()),
    const SizedBox(width: 30),
    Text("Stay", style: Style.appBarMenuStyle()),
    const SizedBox(width: 30),
    Text("Contact", style: Style.appBarMenuStyle()),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      endDrawer: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Drawer(
              child: Container(
                  // margin: const EdgeInsets.symmetric(vertical: 80),
                  color: ColorTheme.bgColor,
                  child: Column(children: menu)))),
      backgroundColor: ColorTheme.bgColor,
      appBar: AppBar(
          actions: const [SizedBox()],
          foregroundColor: Colors.amber,
          backgroundColor: ColorTheme.bgColor,
          toolbarHeight: 80,
          titleSpacing: 100,
          title: size.width > 750 ? titleLarge() : titleSmall()),
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(Assets.banner,
              width: size.width, height: 300, fit: BoxFit.fitWidth),
          Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1,
                  right: size.width * 0.1),
              child: Column(
                children: [
                  ServicesView(),
                  ContactView()
                ],
              ))
        ]),
      ),
    );
  }

  textAnimator(String text) {
    return TyperAnimatedText(text,
        textStyle: Style.abhayaLibre(color: ColorTheme.color12),
        speed: const Duration(milliseconds: 100));
  }

  _title() {
    return Text("Show Go Travels", style: Style.appBarTitleStyle());
  }

  titleLarge() {
    List<Widget> _menu = [
      _title(),
      const Spacer(),
    ];

    _menu.addAll(menu);

    return Row(
      children: _menu,
    );
  }

  titleSmall() {
    return Row(
      children: [
        _title(),
        const Spacer(),
        InkWell(
          onTap: () {
            _key.currentState!.openEndDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: ColorTheme.textColor,
          ),
        ),
      ],
    );
  }

  Drawer sideNav() {
    return Drawer(
        child: Stack(children: <Widget>[
      //first child be the blur background
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //this is dependent on the import statment above
          child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)))),
      ListView(padding: EdgeInsets.zero, children: const <Widget>[
        DrawerHeader(
          child: Text('Hello Drawer Title'),
        ),
      ])
    ]));
  }
}
