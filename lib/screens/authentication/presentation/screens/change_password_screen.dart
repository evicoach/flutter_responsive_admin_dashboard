import 'package:flutter/material.dart';

import '../../../../core/presentation/app_button.dart';
import '../../../../core/presentation/app_widget.dart';
import '../../../../utility/app_colors.dart';
import '../../../../utility/ui_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = "/password-reset-screen";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  final _changePasswordKey = GlobalKey<FormState>();

  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  void _togglePasswordVisibility(String password) {
    if (password == "old") {
      _oldPasswordVisible = !_oldPasswordVisible;
    }
    if (password == "new") {
      _newPasswordVisible = !_newPasswordVisible;
    }
    if (password == "confirm") {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: Form(
              key: _changePasswordKey,
              // onChanged: () => setState(() =>
              //     _enableBtn = _changePasswordKey.currentState?.validate()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: const Icon(Icons.arrow_back),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    "Change password",
                    style: TextStyle(
                      fontSize: scaledFontSize(24, context),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  const Text("Old password",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  AppWidget.buildUserInput(
                      maxLines: 1,
                      controller: oldPasswordController,
                      obscureText: !_oldPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () => _togglePasswordVisibility("old"),
                        child: _oldPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      focusedBorderColor: AppColors.primaryColor,
                      enabledBorderColor: AppColors.greyLineColor,
                      borderRadius: BorderRadius.circular(8),
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      validate: (val) {
                        if (val == null || val.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        // _changePasswordParams.oldPassword = val;
                      }),
                  SizedBox(height: height * 0.02),
                  const Text("New password",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  AppWidget.buildUserInput(
                      // hint: "Enter your address",
                      // hintStyle: AppWidget.hintStyle,
                      maxLines: 1,
                      // initialValue: "abiodun",
                      controller: newPasswordController,
                      focusedBorderColor: AppColors.primaryColor,
                      enabledBorderColor: AppColors.greyLineColor,
                      borderRadius: BorderRadius.circular(8),
                      obscureText: !_newPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () => _togglePasswordVisibility("new"),
                        child: _newPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      validate: (val) {
                        if (val == null || val.isEmpty) {
                          return "This field is required";
                        }

                        return null;
                      },
                      onChanged: (val) {
                        // _changePasswordParams.newPassword = val;
                      },
                      onSaved: (val) {
                        // _changePasswordParams.newPassword = val;
                      }),
                  SizedBox(height: height * 0.02),
                  const Text("Confirm password",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  AppWidget.buildUserInput(
                      // hint: "Enter your address",
                      // hintStyle: AppWidget.hintStyle,
                      maxLines: 1,
                      controller: confirmNewPasswordController,
                      focusedBorderColor: AppColors.primaryColor,
                      enabledBorderColor: AppColors.greyLineColor,
                      borderRadius: BorderRadius.circular(8),
                      obscureText: !_confirmPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () => _togglePasswordVisibility("confirm"),
                        child: _confirmPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      onFieldSubmitted: (val) => setState(() {}),
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      validate: (val) {
                        if (val == null || val.isEmpty) {
                          return "This field is required";
                        }
                        // if (_changePasswordParams.newPassword != val) {
                        //   return "Password did not match";
                        // }
                        return null;
                      },
                      onSaved: (val) {
                        // _changePasswordParams.confirmPassword = val;
                      }),
                  const Spacer(),
                  AppButton(
                    text: "Confirm",
                    fontSize: scaledFontSize(20, context),
                    fontWeight: FontWeight.w500,
                    enabled: true,
                    // isLoading: _passwordUpdating,
                    mainAxisAlignment: MainAxisAlignment.center,
                    backgroundColor: AppColors.primaryColor,
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 20),
                    onPressed: () {
                      // bool? isValid =
                      // _changePasswordKey.currentState?.validate();
                      // if (isValid == null || !isValid) return;
                      // _changePasswordKey.currentState!.save();
                      // print(
                      //     "The update profile params is ${_changePasswordParams.toJson()}");
                      // BlocProvider.of<AuthBloc>(context).add(
                      //     ChangePasswordEvent(params: _changePasswordParams));
                    },
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
