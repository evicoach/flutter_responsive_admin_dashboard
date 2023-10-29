import 'package:flutter/material.dart';

import '../../../../core/presentation/app_back_button.dart';
import '../../../../core/presentation/app_button.dart';
import '../../../../core/presentation/app_image.dart';
import '../../../../utility/app_assets.dart';
import '../../../../utility/app_colors.dart';
import '../../../../utility/ui_utils.dart';
import 'login_screen.dart';

class LogoutScreen extends StatefulWidget {
  static const routeName = "/logout";

  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const AppBackButton(
                  color: AppColors.white,
                  icon: AppImage(path: AppAssets.arrowBackWhite)),
              const SizedBox(height: 16),
              Text(
                "Log Out",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: scaledFontSize(30, context),
                ),
              ),
              const SizedBox(height: 5),
              const Text("Do you want to log out?",
                  style: TextStyle(
                    color: AppColors.white,
                  )),
              const Spacer(),
              Center(
                child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(LoginScreen.routeName),
                    child:  const AppImage(path: AppAssets.logout)),
              ),
              const Spacer(),
              AppButton(
                text: "Log Out",
                fontSize: scaledFontSize(18, context),
                backgroundColor: AppColors.white,
                fontColor: AppColors.primaryColor,
                enabled: true,
                height: 60,
                mainAxisAlignment: MainAxisAlignment.center,
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
