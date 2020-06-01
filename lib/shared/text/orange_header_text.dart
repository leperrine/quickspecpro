import 'package:flutter/material.dart';

class OrangeHeaderText extends StatelessWidget {
  OrangeHeaderText({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Color.fromRGBO(223, 128, 87, 1),
      ),
    );
  }
}
