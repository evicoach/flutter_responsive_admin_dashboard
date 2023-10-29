import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utility/app_colors.dart';
import '../../utility/ui_utils.dart';

class AppWidget {
  static var hintStyle = const TextStyle(color: AppColors.textGrey);
  static var primaryStyle = const TextStyle(color: AppColors.primaryColor);

  static headerStyle(context) => TextStyle(
      fontWeight: FontWeight.w700, fontSize: scaledFontSize(26, context));

  static Widget loadingIndicator({double? radius, Color? color}) {
    return SizedBox(
      height: radius ?? 25,
      width: radius ?? 25,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: color ?? Colors.transparent,
      ),
    );
  }

  static Future showViewDialog({
    required BuildContext context,
    required Widget dialog,
    bool dismissible = false,
  }) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (ctx) {
        return dialog;
      },
    );
  }

  static Future showAppBottomSheet(
      {required BuildContext context,
      initialChildSize = 0.5,
      minChildSize = 0.25,
      maxChildSize = 1.0,
      bool expand = false,
      bool isDismissible = true,
      ShapeBorder? shape,
      required List<Widget> children,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      BorderRadiusGeometry? borderRadius,
      backgroundColor,
      color}) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible,
        backgroundColor: backgroundColor,
        shape: shape,
        builder: (ctx) {
          return DraggableScrollableSheet(
            initialChildSize: initialChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            expand: expand,
            builder: (_, controller) {
              return Container(
                margin: margin ??
                    EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: MediaQuery.of(context).padding.bottom * 0.4),
                decoration: BoxDecoration(
                  color: color ?? AppColors.white,
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                ),
                child: ListView(
                  padding: padding,
                  controller: controller, // set this too
                  children: children,
                ),
              );
            },
          );
        });
  }

  static Widget adaptiveLoadingIndicator({double? radius, Color? color}) {
    return SizedBox(
      height: radius ?? 25,
      width: radius ?? 25,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              radius: radius ?? 18,
            )
          : CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: color ?? Colors.transparent,
            ),
    );
  }

  static showAlertDialog(
    BuildContext context, {
    Function()? continueAction,
    Function()? cancelAction,
    required Text title,
    required Text content,
    required Widget cancelText,
    required Text continueText,
  }) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: cancelText,
      onPressed: () {
        cancelAction!();
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: continueText,
      onPressed: () {
        continueAction!();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: title,
      content: content,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return alert;
      },
    );
  }

  static Widget buildJobCategoryItem(BuildContext context,
      {required String title,
      required Widget icon,
      required Function() handler}) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(7),
      shadowColor: Colors.black38,
      borderOnForeground: false,
      child: GestureDetector(
        onTap: handler,
        child: Container(
          width: 160,
          height: 134,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 0.01),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 20),
              Text(title,
                  style: TextStyle(
                      fontSize: scaledFontSize(12, context),
                      fontWeight: FontWeight.w400))
            ],
          )),
        ),
      ),
    );
  }

  static buildPolicyText(BuildContext context, Function onTapTermsAndConditions,
          Function onTapPrivacyPolicy, privacyUrl, termsAndConditionsUrl) =>
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'By creating an account, you accept Yep\'s ',
              style: TextStyle(
                  color: AppColors.black30,
                  fontSize: scaledFontSize(12, context),
                  height: 1.8),
              children: [
                TextSpan(
                  text: 'Terms, ',
                  style: TextStyle(
                      fontSize: scaledFontSize(12, context),
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => onTapTermsAndConditions(termsAndConditionsUrl),
                ),
                // const TextSpan(text: 'and '),
                TextSpan(
                  text: 'Privacy Policy, Privacy Disclosure',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: scaledFontSize(12, context),
                      color: AppColors.primaryColor,
                      height: 1.6),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onTapPrivacyPolicy(privacyUrl),
                )
              ]),
        ),
      );

  static buildAuthSuggestion(context,
          {required String suggestion,
          required String solution,
          required Function() handler}) =>
      RichText(
        text: TextSpan(
            text: suggestion,
            style: TextStyle(color: AppColors.black, height: 1.6),
            children: [
              TextSpan(
                  text: solution,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                      height: 1.6),
                  recognizer: TapGestureRecognizer()..onTap = handler),
            ]),
      );

  static void showSnackBar(BuildContext context, String message,
      {Duration? duration,
      SnackBarAction? action,
      Color? backgroundColor = AppColors.appRed,
      Color? textColor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration ?? const Duration(seconds: 4),
      backgroundColor: backgroundColor ?? AppColors.black,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor ?? AppColors.white),
      ),
      action: action,
    ));
  }

  static TextStyle userInputStyle() => TextStyle(color: AppColors.primaryColor);

  static Widget buildUserInput(
      {String? hint,
      String? labelText,
      FocusNode? focusNode,
      bool isDense = false,
      TextAlign textAlign = TextAlign.start,
      Function(String? val)? onSaved,
      Function(String val)? onChanged,
      Function(String)? onFieldSubmitted,
      String? Function(String? val)? validate,
      TextInputType? keyboardType,
      BorderRadius borderRadius = BorderRadius.zero,
      // BorderRadius borderRadius = BorderRadius.zero,
      TextEditingController? controller,
      EdgeInsetsGeometry? contentPadding,
      margin,
      String? initialValue,
      Widget? suffixIcon,
      Widget? prefixIcon,
      String? prefixText,
      String? errorText,
      TextStyle? errorStyle,
      bool hasBorder = true,
      Widget? prefix,
      bool filled = false,
      bool enabled = true,
      Color? fillColor,
      Color? enabledBorderColor,
      Color? disabledBorderColor,
      Color? focusedBorderColor,
      Color? cursorColor,
      TextStyle? style,
      int? maxLines,
      BoxDecoration? boxDecoration,
      TextStyle? labelStyle,
      TextStyle? hintStyle,
      InputDecoration? decoration,
      InputBorder? border,
      InputBorder? focusedBorder,
      InputBorder? enabledBorder,
      InputBorder? disabledBorder,
      TextInputAction? textInputAction,
      List<TextInputFormatter>? inputFormatters,
      bool obscureText = false,
      FloatingLabelBehavior? floatingLabelBehavior,
      AutovalidateMode? autoValidateMode,
      Key? key}) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 9),
      decoration: boxDecoration,
      child: TextFormField(
        key: key,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: cursorColor ?? AppColors.primaryColor,
        initialValue: initialValue,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validate,
        autovalidateMode: autoValidateMode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        textAlign: textAlign,
        style: style ?? const TextStyle(),
        decoration: InputDecoration(
            contentPadding: contentPadding,
            isDense: isDense,
            floatingLabelBehavior: floatingLabelBehavior,
            filled: filled,
            enabled: enabled,
            errorText: errorText,
            errorStyle: errorStyle,
            fillColor: fillColor,
            prefixText: prefixText,
            prefix: prefix,
            prefixStyle: const TextStyle(color: AppColors.primaryColor),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            labelText: labelText,
            labelStyle: labelStyle ?? userInputStyle(),
            hintStyle: hintStyle ?? userInputStyle(),
            // filled: true,
            // fillColor: AppColors.textColor2.withOpacity(.05),
            border: border ??
                (hasBorder
                    ? borderRadius != null
                        ? OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: enabledBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                        : UnderlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: enabledBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                    : InputBorder.none),
            focusedBorder: focusedBorder ??
                (hasBorder
                    ? borderRadius != null
                        ? OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: focusedBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                        : UnderlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: focusedBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                    : InputBorder.none),
            enabledBorder: enabledBorder ??
                (hasBorder
                    ? borderRadius != null
                        ? OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: enabledBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                        : UnderlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: enabledBorderColor ??
                                    AppColors.primaryColor,
                                width: 1))
                    : InputBorder.none),
            disabledBorder: disabledBorder ??
                (hasBorder
                    ? borderRadius != null
                        ? OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color:
                                    enabledBorderColor ?? AppColors.transparent,
                                width: 1))
                        : UnderlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: disabledBorderColor ??
                                    AppColors.transparent,
                                width: 1))
                    : InputBorder.none)),
      ),
    );
  }
}
