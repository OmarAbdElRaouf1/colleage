import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../onboarding/on_baording_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> textAnimation;
  late Animation<double> logoAnimation;

  late Animation<double> opacityAnimation;

  @override
  void initState() {
    excuteNavigation();
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    textAnimation = Tween<double>(begin: -50, end: -5).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutSine),
    );

    logoAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Transform.translate(
                      offset: Offset(logoAnimation.value, 0),
                      child: Container(
                        width: 98,
                        height: 94,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/logo.svg', width: 70, height: 70, fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Opacity(
                  opacity: opacityAnimation.value,
                  child: Transform.translate(
                      offset: Offset(textAnimation.value, 0),
                      child: SvgPicture.asset(
                        'assets/suits.svg',
                        width: 100,
                        height: 50,
                      )),
                ),
              ],
            ),
          );
        });
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnBaordingView()),
      );
    });
  }
}
