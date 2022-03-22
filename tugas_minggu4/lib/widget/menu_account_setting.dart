import 'package:flutter/material.dart';

import '../shared/theme.dart';

class MenuItemSetting extends StatelessWidget {
  final String imageUrl;
  final String title;
  const MenuItemSetting({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ]),
      child: Row(children: [
        Image.asset(
          imageUrl,
          width: 16,
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: Text(
            title,
            style: textStyle6.copyWith(fontSize: 12),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: textColor6,
        )
      ]),
    );
  }
}
