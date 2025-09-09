import 'package:collage/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
              'assets/profile.jpg',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Omar Abd El Raouf',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            image: 'assets/user.png',
            text: 'Profile',
            onPressed: () {},
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            image: 'assets/menu.png',
            text: 'My Orders',
            onPressed: () {},
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            image: 'assets/credit-card.png',
            text: 'Payment Methods',
            onPressed: () {},
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            image: 'assets/heart.png',
            text: 'Wishlist',
            onPressed: () {},
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Setting',
            image: 'assets/setting.png',
            onPressed: () {},
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            image: 'assets/logout.png',
            text: 'Logout',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
