import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/loginProvider.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:provider/provider.dart';

import 'logic/providers/repoDetailsProv.dart';
import 'modules/home/splashScreen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> MainProvider()),
      ChangeNotifierProvider(create: (_)=> LoginProvider()),
      ChangeNotifierProvider(create: (_)=> RepoDetailsProv()),
    ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Demo',
      home: SplashScreen(),
    );
  }
}

