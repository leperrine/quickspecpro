import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String logo = 'assets/logo.svg';
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      logo,
      semanticsLabel: 'Quick Spec Pro',
      height: 80.0,
    );
  }
}
