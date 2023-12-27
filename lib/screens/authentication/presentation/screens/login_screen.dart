import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/app_back_button.dart';
import '../../../../core/presentation/app_button.dart';
import '../../../../core/presentation/app_widget.dart';
import '../../../../utility/app_colors.dart';
import '../../../../utility/ui_utils.dart';
import '../../../../utility/validator.dart';
import '../../data/models/params/login_params.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login-screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  var phoneNumber = "";

  bool authenticating = false;

  GlobalKey<FormState> _loginForm = GlobalKey();

  LoginParams loginParams = LoginParams();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (ctx, state) {
          if (state is LoggingIn) {
            setState(() {
              authenticating = true;
            });
          }
          if (state is LoginSuccess) {
            setState(() {
              authenticating = false;
            });

            // update user info in the app
            BlocProvider.of<UserBloc>(context).add(UpdateUserEvent(state.data));
            Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
          }
          if (state is LoginError) {
            setState(() {
              authenticating = false;
            });
            AppWidget.showSnackBar(context, state.message!,
                backgroundColor: AppColors.black);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _loginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    const SizedBox(height: 30),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: scaledFontSize(30, context)),
                    ),
                    const SizedBox(height: 8),
                    const Text("Login to your already existing Vida account.",
                        style: TextStyle(
                          color: AppColors.appGreen,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(height: 50),
                    const Text("Phone number"),
                    AppWidget.buildUserInput(
                      focusedBorderColor: AppColors.white,
                      enabledBorderColor: AppColors.borderGrey,
                      // fillColor: AppColors.white,
                      // filled: true,
                      onSaved: (val) {
                        loginParams.username = "$val";
                      },
                      validate: (val) =>
                          PhoneNumberValidator.validatePhoneNumber(val!),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      // prefixIcon: countryCodeSelector(
                      //     color: AppColors.white,
                      //     code: country == null ? '' : country!.phoneCode,
                      //     onTap: () {
                      //       openCountryPicker(
                      //           context,
                      //           (Country country) => setState(() {
                      //                 this.country = country;
                      //               }));
                      //     }),
                      maxLines: 1,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    const Text("Password"),
                    AppWidget.buildUserInput(
                        labelText: "Enter your password",
                        maxLines: 1,
                        labelStyle: AppWidget.hintStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorderColor: AppColors.white,
                        enabledBorderColor: AppColors.greyLineColor,
                        borderRadius: BorderRadius.circular(8),
                        obscureText: !_passwordVisible,
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: _passwordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        validate: (val) {
                          if (val == null || val.isEmpty) {
                            return "Password name is required";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          loginParams.password = val?.trim();
                        }),
                    Expanded(flex: 1, child: Container()),
                    AppButton(
                      text: "Login",
                      fontSize: scaledFontSize(18, context),
                      fontWeight: FontWeight.w500,
                      enabled: true,
                      height: 65,
                      isLoading: authenticating,
                      mainAxisAlignment: MainAxisAlignment.center,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        bool isValid = _loginForm.currentState!.validate();
                        if (!isValid) {
                          return;
                        }
                        _loginForm.currentState!.save();
                        BlocProvider.of<AuthBloc>(context)
                            .add(LoginEvent(params: loginParams));
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
