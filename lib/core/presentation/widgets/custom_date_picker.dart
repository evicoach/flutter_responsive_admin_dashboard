import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utility/ui_utils.dart';
import '../../../utility/app_colors.dart';
import '../app_button.dart';

class CustomDatePicker extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;
  final String? Function(DateTime?)? validator;
  final DateFormat? dateFormat;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final DateTime? firstDate;

  const CustomDatePicker({
    Key? key,
    required this.onDateSelected,
    this.validator,
    required this.dateFormat,
    this.lastDate,
    this.firstDate,
    this.initialDate,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _dateTime = DateTime.now();
  String _selectedDate = "";

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.dateFormat?.format(DateTime.now()) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
                  height: 300,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.only(left: 18.5, right: 18.5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: CupertinoTimerPicker(
                          onTimerDurationChanged: (val){
                            // _selectedDate =
                            // "${widget.dateFormat?.format(datetime)}";
                            // widget.onDateSelected!(datetime);
                          },
                            // minimumDate: widget.firstDate,
                            // maximumDate: widget.lastDate
                            //     ?.add(const Duration(seconds: 1)),
                            // mode: CupertinoDatePickerMode.dateAndTime,
                            // initialDateTime: _dateTime,
                            // onDateTimeChanged: (datetime) {
                            //   _selectedDate =
                            //       "${widget.dateFormat?.format(datetime)}";
                            //   widget.onDateSelected!(datetime);
                            // }
                            ),
                      ),
                      AppButton(
                        text: "Confirm",
                        enabled: true,
                        fontColor: AppColors.primaryColor,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        mainAxisAlignment: MainAxisAlignment.center,
                        onPressed: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ));
      },
      child:
      // Platform.isIOS
      //     ? Container(
      //         height: 46,
      //         padding:
      //             const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(7),
      //             border: Border.all(color: AppColors.enabledBorderColor)),
      //         child: Row(
      //           children: [
      //             Text(_selectedDate),
      //             const Spacer(),
      //             const Icon(
      //               Icons.calendar_month,
      //               color: AppColors.enabledBorderColor,
      //             )
      //           ],
      //         ),
      //       )
           DateTimeFormField(
              dateFormat: widget.dateFormat,
              // lastDate: DateTime.now(),
              initialValue: widget.initialDate,
              lastDate: widget.lastDate,
              firstDate: widget.firstDate,
              initialDate: widget.initialDate,
              dateTextStyle: TextStyle(fontSize: scaledFontSize(13, context)),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white.withOpacity(0.5),
                hintStyle: const TextStyle(color: Colors.black45),
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 16, right: 2),
                errorStyle: const TextStyle(color: Colors.redAccent),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: const Color(0xFFD2D3D1).withOpacity(0.5))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: const Color(0xFFD2D3D1).withOpacity(0.5))),
                suffixIcon: const Icon(
                  Icons.event_note,
                  color: Color(0xFFA5A8A3),
                ),
              ),
              mode: DateTimeFieldPickerMode.date,
              validator: widget.validator,
              onDateSelected: widget.onDateSelected,
            ),
    );
  }
}
