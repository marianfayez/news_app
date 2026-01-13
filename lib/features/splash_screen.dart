import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/gen/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(const Duration(seconds: 4), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Assets.images.splashLogo.image(),
            const Spacer(),
            Assets.images.branding.image(),
            Text("Supervised by Mohamed Nabil",style: Theme.of(context).textTheme.titleSmall,)

          ],
        ),
      ),
    );
  }
}
