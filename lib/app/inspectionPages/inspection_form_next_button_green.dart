import 'package:flutter/material.dart';

class InspectionFormNextButtonGreen extends StatelessWidget {
  InspectionFormNextButtonGreen({@required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      elevation: 2,
      textColor: Colors.white,
      icon: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      label: Text('Next'),
      color: Colors.green,
      onPressed: onPressed,
    );
  }
}
