import 'package:flutter/material.dart';
import '../shared/theme.dart';

class Footer extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onPressed;
  const Footer({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle6.copyWith(fontWeight: medium),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                buttonTitle,
                style:
                    textStyle1.copyWith(fontWeight: medium),
              ),
            ),
          ],
        ),
      );
  }
}
