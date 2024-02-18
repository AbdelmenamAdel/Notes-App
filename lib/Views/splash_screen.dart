import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:notes_app/Views/notes_view.dart';
import 'package:notes_app/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            blue,
            kPrimaryColor,
            blue,
          ],
        ),
        childWidget: SizedBox(
          height: 175,
          child: Image.asset('assets/icons/app_icon.png'),
        ),
        duration: const Duration(milliseconds: 3000),
        animationDuration: const Duration(milliseconds: 1500),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: const NotesView());
  }
}
