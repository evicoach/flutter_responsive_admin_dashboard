import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';
import 'app_widget.dart';

class DropdownWidget<T> extends StatefulWidget {
  final List<T> elements;
  final Widget hint;
  final Widget Function(dynamic) selectedElementBuilder;
  final Widget Function(dynamic) itemBuilder;
  final void Function(dynamic) whenElementSelected;
  final List<T> Function(dynamic)? searchHandler;
  final bool loadStatus;
  final Color? backgroundColor;
  final double maxChildSize;
  final double? minChildSize;
  final double? initialChildSize;
  final bool searchable;

  const DropdownWidget({
    Key? key,
    this.backgroundColor,
    this.searchable = false,
    this.searchHandler,
    this.maxChildSize = 0.5,
    this.minChildSize = 0.5,
    this.initialChildSize = 0.5,
    required this.elements,
    required this.loadStatus,
    required this.itemBuilder,
    required this.selectedElementBuilder,
    required this.hint,
    required this.whenElementSelected,
  }) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget> {
  T? selectedElement;
  List searchResult = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.elements.isEmpty) return;
        searchResult.clear();
        AppWidget.showAppBottomSheet(
            initialChildSize: widget.initialChildSize ?? 0.5,
            maxChildSize: widget.maxChildSize,
            minChildSize: widget.minChildSize,
            margin: EdgeInsets.zero,
            backgroundColor: AppColors.transparent,
            color: AppColors.white,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 5,
            ),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            context: context,
            children: [
              StatefulBuilder(builder: (ctx, setInnerState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.searchable)
                      AppWidget.buildUserInput(
                        maxLines: 1,
                        hint: "Search...",
                        onChanged: (value) {
                          searchResult.clear();
                          searchResult.addAll(widget.searchHandler!(value));
                          setInnerState(() {});
                        },
                        borderRadius: BorderRadius.circular(8),
                        focusedBorderColor: AppColors.primaryColor,
                        enabledBorderColor: AppColors.greyLineColor,
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                      ),
                    if (searchResult.isNotEmpty)
                      ...searchResult.map<Widget>((element) {
                        return InkWell(
                            onTap: () {
                              selectedElement = element;
                              Navigator.of(context).pop();
                              setState(() {});
                              widget.whenElementSelected(selectedElement);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.greyLineColor))),
                                child: widget.itemBuilder(element)));
                      }).toList(),
                    if (searchResult.isEmpty)
                      ...widget.elements.map((element) {
                        return InkWell(
                            onTap: () {
                              selectedElement = element;
                              Navigator.of(context).pop();
                              setState(() {});
                              widget.whenElementSelected(selectedElement);
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.greyLineColor))),
                                child: widget.itemBuilder(element)));
                      }).toList()
                  ],
                );
              })
            ]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.greyLineColor,
            )),
        child: Row(
          children: [
            if (widget.loadStatus)
              const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ))
            else if (!widget.loadStatus && selectedElement != null)
              widget.selectedElementBuilder(selectedElement),
            if (widget.loadStatus) const SizedBox(width: 20),
            // if (widget.loadStatus != Loader.loaded)
            // if no element have been selected
            if (selectedElement == null) widget.hint,
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xFF5E646C),
            ),
          ],
        ),
      ),
    );
  }
}
