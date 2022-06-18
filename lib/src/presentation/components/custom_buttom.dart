import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Function? onPressed;

  CustomButtom(
      {required this.backgroundColor,
      required this.text,
      this.onPressed,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
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
              child: Text(
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
