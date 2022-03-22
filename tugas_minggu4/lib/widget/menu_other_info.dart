import 'package:flutter/material.dart';

import '../shared/theme.dart';

class MenuOtherInfo extends StatelessWidget {
  final String title;
  final bool subtitle;
  const MenuOtherInfo({
    Key? key,
    required this.title,
    this.subtitle = false,
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
        Expanded(
          child: Text(
            title,
            style: textStyle6.copyWith(fontSize: 12),
          ),
        ),
        subtitle
            ? Text(
                "Version 1.0.0",
                style: textStyle6.copyWith(
                    fontSize: 10, fontStyle: FontStyle.italic),
              )
            : SizedBox(),
      ]),
    );
  }
}
