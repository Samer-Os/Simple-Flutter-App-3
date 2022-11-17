import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '/favorite_screen.dart';
import 'package:provider/provider.dart';
import '/my_home_page.dart';
import 'provider/names_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Names(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case FavoriteNames.route:
              return PageTransition(
                child: const FavoriteNames(),
                type: PageTransitionType.rightToLeft,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
