import 'package:collage/core/helper_functions/app_colors.dart';
import 'package:collage/features/home/presentation/views/pages/setting_view.dart';
import 'package:collage/features/home/presentation/views/pages/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'MainView';
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text("الرئيسية")),
    WishListVeiw(),
    Center(child: Text("سلة التسوق")),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.005,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: GNav(
              tabBackgroundGradient: const LinearGradient(
                colors: [
                  Color(0xFFDADADA),
                  Color(0xFFDADADB),
                ],
              ),
              activeColor: AppColors.primary,
              rippleColor: Colors.grey[300]!,
              color: Colors.black,
              gap: 8,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Iconsax.home,
                  text: "Home",
                ),
                GButton(
                  icon: Iconsax.heart,
                  text: "Favorites",
                ),
                GButton(
                  icon: Iconsax.shopping_cart4,
                  text: "Cart",
                ),
                GButton(
                  icon: Iconsax.user,
                  text: "Profile",
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
