import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicScaffold extends StatelessWidget {
  const BasicScaffold({
    Key key,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
  }) : super(key: key);

  final Widget body;
  final FloatingActionButton floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final BottomSheet bottomSheet;

  @override
  Widget build(BuildContext context) {
    final String logo = 'assets/logo.svg';
    final Widget svg = SvgPicture.asset(
      logo,
      semanticsLabel: 'Quick Spec Pro',
      height: 80.0,
    );
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[svg],
      ),
      body: body,
      bottomSheet: bottomSheet,
      // bottomNavigationBar: AppTabBar,
    );
  }
}
