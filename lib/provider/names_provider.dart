import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import '/provider/name_provider.dart';

class Names with ChangeNotifier {
  List<Name> names = [];
  List<Name> favoriteNames = [];

  void addToList() {
    var word;
    while (names.length < 5000) {
      word = WordPair.random().asPascalCase.toString();
      if (!names.contains(word)) {
        names.add(Name(name: word));
      }
    }
    notifyListeners();
  }

  void toggleFavorite(String name) {
    Name item = names.firstWhere((element) => element.name == name);
    item.isFavorite = !item.isFavorite;
    if (item.isFavorite) {
      favoriteNames.add(item);
    } else {
      favoriteNames.remove(item);
    }
    notifyListeners();
  }
}
