import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/providers/counterprovider.dart';
import 'package:provider/provider.dart';
import 'core/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
