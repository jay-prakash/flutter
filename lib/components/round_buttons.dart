import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  RoundButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Icon(
          icon,
          color: Colors.blue.shade50,
        ),
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(3.0),
      ),
    );
  }
}
