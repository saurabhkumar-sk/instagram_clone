import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/screens/random_user_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        // fontFamily: 'Cookie',
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.pink),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Home Page'),
      // home: const UserScreen(),
      home: const RandomUserScreen(),
      // home: const ReverPodScreen(),
    );
  }
}
