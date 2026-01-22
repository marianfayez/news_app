import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/routes/auto_route.gr.dart';
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
      context.router.replace(HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.splashLogo.image(),
            // const Spacer(),
            // Assets.images.branding.image(),
            // Text(
            //   "Supervised by Mohamed Nabil",
            //   style: getRegular(color: ColorManager.white),
            // )
          ],
        ),
      ),
    );
  }
}
