
import 'package:converter/screens/convert_result/buildvu_success_screen.dart';
import 'package:converter/screens/home_screen.dart';
import 'package:converter/screens/others/why_buildvu_screen.dart';
import 'package:converter/screens/sandbox.dart';
import 'package:converter/screens/token/formu_token_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const HomeScreen(), 
      home: FormvuTokenScreen(),
      // home: const Sandbox(),
    );
  }
}
