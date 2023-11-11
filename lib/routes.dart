import 'package:admin/screens/authentication/presentation/screens/login_screen.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/new_coupon/new_coupon_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  DashboardScreen.routeName: (ctx) => DashboardScreen(),
  NewCouponScreen.routeName: (ctx) => const NewCouponScreen(),
  MainScreen.routeName: (ctx) => MainScreen()
};
