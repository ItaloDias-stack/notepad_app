import 'package:flutter/material.dart';

class CustomIconButtom extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Function? onPressed;
  final Icon icon;

  CustomIconButtom(
      {required this.backgroundColor,
      required this.text,
      this.onPressed,
      required this.icon,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton.icon(
              icon: icon,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(backgroundColor),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              label: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
              onPressed: () => onPressed!(),
            ),
          ),
        ],
      ),
    );
  }
}
