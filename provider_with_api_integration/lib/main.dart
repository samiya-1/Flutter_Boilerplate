import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_boilerplate_flutter/provider/user_provider.dart';
import 'package:provider_boilerplate_flutter/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}