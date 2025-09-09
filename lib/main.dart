import 'package:collage/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CollageApp());
}

class CollageApp extends StatelessWidget {
  const CollageApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
