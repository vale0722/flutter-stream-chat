import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final String urlImage;
  final double radius;

  const ProfileImageWidget({
    Key key,
    this.urlImage,
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = urlImage ?? 'https://cdn1.iconfinder.com/data/icons/seo-outline-colored-5/128/Spy_Hacker_criminal_Security_unknown_Anonymous_1-512.png';

    return GestureDetector(
          onTap: () {},
          child:  CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: radius,
          )
      );
  }
}