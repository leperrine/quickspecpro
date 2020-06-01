import 'package:flutter/material.dart';

class IconHeaderText extends StatelessWidget {
  IconHeaderText({
    @required this.icon,
    @required this.headerText,
  });
  final IconData icon;
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:4.0),
          child: Icon(icon, color: Colors.blue),
        ),
        Text(
          headerText,
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
