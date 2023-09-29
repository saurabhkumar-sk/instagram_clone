import 'package:flutter/material.dart';
import 'package:instagram/povider/user_provider.dart';
import 'package:instagram/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Userprovider(),
        )
      ],
      child: MaterialApp(
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
        home: const UserScreen(),
      ),
    );
  }
}
