import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'post.dart';
import 'photos.dart';
import 'provider/photo_provider.dart';
import 'provider/post_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => PhotoProvider()),
      ],
      child: MaterialApp(
        title: 'Pertemuan 8 - Consume API',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PostPage(),
          '/photos': (context) => PhotoPage(),
        },
      ),
    );
  }
}
