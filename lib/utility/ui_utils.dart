import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../core/presentation/app_button.dart';
import '../core/presentation/widgets/custom_loader.dart';
import 'app_colors.dart';

class MessageHolder {
  String reason = "";
}

Future<void> showSendingData(context,
    {text, Color color = AppColors.black}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: CustomLoader(
            color: color, // Replace with your desired color
          ),
        ),
      );
    },
  );
}

double scaledFontSize(double fontSize, BuildContext context) {
  double scaleFactor = MediaQuery.of(context).textScaleFactor;
  if (scaleFactor > 1.1) {
    scaleFactor = 1.1;
    return fontSize * scaleFactor;
  }
  return fontSize * scaleFactor;
}

String splitIntoMultiLines(String name, int limit) {
  var result = "";

  if (name.length < limit) {
    return name;
  }
  result = "${name.substring(0, limit)}\n${name.substring(limit)}";
  return result;
}

String shortenName(String name, int limit) {
  var result = "";
  if (name.length < limit) {
    return name;
  }
  result = "${name.substring(0, limit - 3)}...";

  return result;
}

AppButton buildUploadFileButton({
  required String title,
  Function()? handler,
  required bool isLoading,
  String? documentUrl,
  XFile? document,
}) {
  return AppButton(
    text: title,
    fontColor: isLoading ? AppColors.transparent : AppColors.black,
    icon: isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 0.6,
            ),
          )
        : Icon(
            documentUrl != null && documentUrl.isNotEmpty
                ? Icons.verified_rounded
                : Icons.cloud_upload,
            color: documentUrl != null && documentUrl.isNotEmpty
                ? AppColors.appGreen
                : AppColors.black,
            size: 15,
          ),
    borderColor: AppColors.greyLineColor,
    enabled: true,
    // isLoading: isLoading,
    // margin: EdgeInsets.only(top: 20),
    backgroundColor: AppColors.white,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    onPressed: handler,
  );
}

Text buildUploadFileTitle(BuildContext context, {required String title}) {
  return Text(
    title,
    style: TextStyle(
        fontSize: scaledFontSize(14, context), fontWeight: FontWeight.w500),
  );
}

String? validateEmail(String? val) {
  val = val?.trim();
  if (val == null || val.isEmpty) {
    return "Email is required";
  }
  RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (!emailRegex.hasMatch(val)) {
    return "Please enter a valid email address";
  }
  return null;
}

numberFormatter(String input) =>
    NumberFormat.currency(decimalDigits: 2, customPattern: '#,###.##')
        .format(num.parse(input));

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(selectedDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    selectedTime.hour,
    selectedTime.minute,
  );
}
