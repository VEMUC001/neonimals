import 'package:cinsie_neonimals/constants/color_constants.dart';
import 'package:cinsie_neonimals/features/responsive/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Cinsie Neonimals',
        theme: ThemeData(
          primarySwatch: Pallete.customPrimaryColor,
        ),
        home: const LandingPage(),
      ),
    );
  }
}
