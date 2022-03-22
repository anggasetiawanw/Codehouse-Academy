import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double height;
  final double width;
  final double marginTop;
  final bool changeColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height = 50,
    this.width = double.infinity,
    this.marginTop = 30,
    this.changeColor = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: marginTop),
        height: height,
        width: width,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: changeColor ? buttonColor2 : buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: changeColor
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(title, style: textStyle2.copyWith(fontWeight: bold)),
                  ],
                )
              : Text(title, style: textStyle2.copyWith(fontWeight: bold)),
        ));
  }
}
