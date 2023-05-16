import 'package:cinsie_neonimals/features/home/views/home_option2.dart';
import 'package:cinsie_neonimals/features/home/views/home_option2_mobile.dart';
import 'package:cinsie_neonimals/features/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: HomeOption2Mobile(),
        desktopBody: HomeOption2(),
      ),
    );
  }
}
