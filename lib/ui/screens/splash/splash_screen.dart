import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pandawa_agri_indo_test/ui/screens/auth/login_screen.dart';
import 'package:pandawa_agri_indo_test/ui/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  checkPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    const duration = Duration(seconds: 3);
    if (token != null) {
      return Timer(duration, () {
        Get.off(() => const HomeScreenPage());
      });
    } else {
      return Timer(duration, () {
        Get.off(() => const LoginPage());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/logo.png', width: 240.w, height: 240.h),
          ),
        ),
      ),
    );
  }
}
