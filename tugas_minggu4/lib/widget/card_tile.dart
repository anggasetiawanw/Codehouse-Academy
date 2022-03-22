import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CardTile extends StatelessWidget {
  final String imagePhotoUrl;
  final String imageUrl;
  final String name;
  final String subtitle;
  final String countLike;

  const CardTile(
      {Key? key,
      required this.imagePhotoUrl,
      required this.imageUrl,
      required this.name,
      required this.subtitle, required this.countLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePhotoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textStyle2.copyWith(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: textStyle2.copyWith(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Text(countLike, style: textStyle2),
              SizedBox(
                width: 2,
              ),
              Icon(Icons.favorite, color: Colors.white, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
