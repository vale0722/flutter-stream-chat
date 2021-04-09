import 'package:flutter/material.dart';

class User {
  final String idUser;
  final String name;
  final String imageUrl;
  final bool isOnline;

  const User({
      @required this.idUser,
      @required this.name,
      @required this.imageUrl,
      this.isOnline = false,
  });
}