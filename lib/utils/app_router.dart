import 'package:flutter/material.dart';
import 'package:knowello/widgets/custom_nav_bar/custom_nav_bar.dart';

Map<String, WidgetBuilder> get appRouter {
  return {
    '/bottomNavBar': (context) => const CustomBottomNavigationBar(),
  };
}
