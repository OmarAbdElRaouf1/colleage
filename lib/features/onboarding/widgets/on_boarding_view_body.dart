import 'package:collage/features/onboarding/widgets/get_started.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../splash/splash_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStartedView()),
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: [
            _buildPage(
              image: 'assets/on1.png',
              title: 'Welcome To\nFashion',
              subtitle:
                  'Discover the latest trends and exclusive styles\nfrom our top designers.',
            ),
            _buildPage(
              image: 'assets/on2.png',
              title: 'Edit Your Collage',
              subtitle: 'Customize your designs easily.',
            ),
            _buildPage(
              image: 'assets/on3.png',
              title: 'Share with Friends',
              subtitle: 'Save and share your creations instantly.',
            ),
          ],
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                // زرار Skip يظهر فقط لو مش في الصفحة الثالثة
                if (_currentPage != 2)
                  Align(
                    alignment: Alignment.topRight,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                const Spacer(),
                Row(
                  children: [
                    // زرار Back يظهر فقط لو مش في الصفحة الأولى
                    if (_currentPage > 0)
                      FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        shape: const CircleBorder(),
                        elevation: 0,
                        onPressed: _goToPreviousPage,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.orange,
                        ),
                      )
                    else
                      const SizedBox(width: 56), // مساحة فارغة مكان الزرار
                    const Spacer(),
                    DotsIndicator(
                      dotsCount: 3,
                      position: _currentPage.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: Colors.orange,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.orange,
                      shape: const CircleBorder(),
                      onPressed: _goToNextPage,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          bottom: 120,
          left: 20,
          right: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
