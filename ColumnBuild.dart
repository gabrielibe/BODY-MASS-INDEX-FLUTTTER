import 'package:flutter/material.dart';



class childCol extends StatelessWidget {
  final IconData Ico;
  final String pm;

  childCol({this.Ico, this.pm});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Ico,
          size: 50,
        ),
        SizedBox(
          height: 15,
        ),
        Text(pm),
      ],
    );
  }
}