import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/names_provider.dart';

class FavoriteNames extends StatelessWidget {
  const FavoriteNames({Key? key}) : super(key: key);
  static const route = 'FavoriteNamesRoute';

  @override
  Widget build(BuildContext context) {
    var favoriteNames = Provider.of<Names>(context).favoriteNames;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: favoriteNames.isEmpty
          ? const Center(
              child: Text('No favorite added yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: favoriteNames.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriteNames[index].name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
    );
  }
}
