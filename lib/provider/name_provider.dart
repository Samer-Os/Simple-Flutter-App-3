import 'package:flutter/material.dart';

class Name with ChangeNotifier {
  final String name;
  bool isFavorite;

  Name({
    required this.name,
    this.isFavorite = false,
  });
}
