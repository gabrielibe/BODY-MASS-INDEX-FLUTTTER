import 'package:flutter/material.dart';

class buildbox extends StatelessWidget {
  buildbox({@required this.colort, this.cardchild,this.gest });

  final Color colort;
  final Widget cardchild;
  final Function gest;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: gest,
        child: Container(
          child: cardchild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colort,
            // Color(0xff1d1e33),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

    );
  }}