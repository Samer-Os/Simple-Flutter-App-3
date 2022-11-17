import 'package:flutter/material.dart';
import '/favorite_screen.dart';
import 'package:provider/provider.dart';

import 'provider/names_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero)
        .then((_) => Provider.of<Names>(context, listen: false).addToList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var names = Provider.of<Names>(context).names;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteNames.route);
            },
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 8,
          right: 8,
          left: 8,
        ),
        itemCount: names.length,
        itemBuilder: (ctx, index) => Column(
          children: [
            ListTile(
              leading: Text(
                names[index].name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: names[index].isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
              onTap: () {
                Provider.of<Names>(context, listen: false)
                    .toggleFavorite(names[index].name);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
