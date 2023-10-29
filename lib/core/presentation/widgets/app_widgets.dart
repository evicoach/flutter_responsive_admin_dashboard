import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/dimens.dart';
import '../styles/text_styles.dart';
import '../styles/theme.dart';
import 'custom_loader.dart';

Future<void> showSendingData(context, {text}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: const AlertDialog(
          content: CustomLoader(
            color: ACCENT_COLOR, // Replace with your desired color
          ),
        ),
      );
    },
  );
  // return Get.dialog(
  //   const CustomLoader(
  //     color: ACCENT_COLOR,
  //   ),
  //   barrierDismissible: false,
  // );
}

void showCustomLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        // Disable back button while the loader is shown
        onWillPop: () async => false,
        child:  const Dialog(
          backgroundColor: Colors.transparent,
          child: CustomLoader(
            color: ACCENT_COLOR, // Replace with your desired color
          ),
        ),
      );
    },
  );
}

Widget authBackgroundOne({child, context}) {
  return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: child,
        ),
        Image.asset(
          AppAssets.backgroundImagePattern,
          fit: BoxFit.cover,
          height: 60,
          width: width(context),
        )
      ],
    ),
  );
}

Widget transparentButton({onTap, color, text, textColor, outlineColor}) =>
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? PRIMARY,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: outlineColor ?? PRIMARY, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Text(
              text ?? '',
              style: buttonTextStyle(color: textColor),
            )),
          ),
        ),
      ),
    );

Widget accentButton({onPressed, title, textColor}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        title ?? '',
        style: underlineButtonTextStyle(color: textColor),
      ));
}

Widget primaryButton(
        {onClick,
        color,
        text,
        textColor = WHITE,
        buttonPadding,
        hPadding,
        vPadding}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          vertical: vPadding ?? 0.0, horizontal: hPadding ?? 0.0),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? PRIMARY,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(buttonPadding ?? 15.0),
            child: Center(
                child: Text(
              text ?? '',
              style: buttonTextStyle(color: textColor),
            )),
          ),
        ),
      ),
    );

Widget defaultAppBar(text, {goBack}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      backButton(goBack: goBack),
      Text(
        text,
        style: const TextStyle(
            fontSize: 20, letterSpacing: 0.7, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget buildAuthSteps(int index, int length) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(length, (i) {
      return Container(
        height: 5,
        width: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: i <= index ? TRANSPARENT_ACCENT_COLOR : GREY1,
        ),
      );
    }),
  );
}

Widget countryCodeSelector({color, onTap, code}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 75,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color ?? GREY1,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(children: [
        Text(
          '+${code ?? ''}',
          style: bodyStyle(color: BLACK),
        ),
        const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: BLACK,
        )
      ]),
    ),
  );
}

Widget backButton({goBack}) {
  return InkWell(
    onTap: () {
      if (goBack == null) {
        // Get.back();
      } else {
        // Get.offAll(() => const BottomNav());
      }
    },
    child: Container(
      decoration: const BoxDecoration(
          color: VERY_TRANSPARENT_ACCENT_COLOR, shape: BoxShape.circle),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.west, color: ACCENT_COLOR, size: 20),
      ),
    ),
  );
}

Widget exportButton({onTap}) {
  return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: VERY_TRANSPARENT_ACCENT_COLOR, shape: BoxShape.circle),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.ios_share_outlined, color: ACCENT_COLOR, size: 20),
        ),
      ));
}

showGeneralModal(BuildContext context, Widget child, {double? myH}) {
  myH ??= height(context) / 1.3;
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => SingleChildScrollView(
      child: Container(
          color: Colors.transparent,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: Navigator.of(context).pop,
                      child: Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: GREY2.withOpacity(0.9),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          color: WHITE,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: Navigator.of(context).pop,
                      child: Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: GREY2.withOpacity(0.9),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: WHITE,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: myH,
                  width: width(context),
                  decoration: const BoxDecoration(
                    color: BACKGROUND,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: child),
            ],
          )),
    ),
  );
}
