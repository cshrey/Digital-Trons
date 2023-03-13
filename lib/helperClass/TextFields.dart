import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MyColors.dart';

class CustomBorderTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? style;
  String? labelText;
  TextStyle? labelStyle;
  bool? obscureText;
  Function(String)? onChanged;
  int? maxLines;
  int? minLines;
  int? maxLength;
  String? initialText = '';
  bool showBorder = true;
  bool isEnable = true;
  bool? showError = true;
  Widget? suffixIcon;
  String? errorText;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  TextInputFormatter? textInputFormatter;

  CustomBorderTextField(
      {Key? key,
        this.controller,
        this.maxLength,
        this.keyboardType,
        this.initialText,
        this.textCapitalization,
        this.hintText,
        this.hintStyle,
        this.onChanged,
        this.obscureText,
        this.maxLines,
        this.minLines,
        this.labelText,
        required this.showBorder,
         required this.isEnable,
        this.showError,
        this.suffixIcon,
        this.textInputFormatter,
        this.errorText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: TextField(
                enabled: isEnable,
                obscureText: obscureText ?? false,
                controller: controller,
                // !..value = TextEditingValue(
                //    // text: initialText ?? '',
                //     selection: TextSelection.fromPosition(
                //         TextPosition(offset: controller!.text.length))),
                style:
                style ?? const TextStyle(fontFamily: "Poppins", fontSize: 18),
                onChanged: onChanged,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                cursorColor: MyColors.ThemeColor,
                keyboardType: keyboardType ?? TextInputType.text,

                textCapitalization: textCapitalization ?? TextCapitalization.characters,
                inputFormatters: [
                  textInputFormatter ?? LengthLimitingTextInputFormatter(100)
                ],
                decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    border: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))
                        : InputBorder.none,
                    focusedBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    suffixIcon: suffixIcon,
                    disabledBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    hintText: hintText ?? "",
                    hintStyle:
                    hintStyle ?? const TextStyle(fontFamily: "Poppins"),
                    labelText: labelText ?? "",
                    labelStyle: labelStyle ??
                        const TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 80, 79, 79))),
              ),
            ),
            // Visibility(
            //   visible: errorText != "",
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //         left: 8.0,
            //         top: 5.0,
            //       ),
            //       child: Text(
            //         errorText ?? "",
            //         style: const TextStyle(
            //             fontFamily: 'Poppins', color: Colors.red, fontSize: 12),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomMobileTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? style;
  String? labelText;
  TextStyle? labelStyle;
  bool? obscureText;
  Function(String)? onChanged;
  int? maxLines;
  int? minLines;
  int? maxLength;
  String? initialText = '';
  bool showBorder = true;
  bool isEnable = true;
  bool? showError = true;
  Widget? suffixIcon;
  String? errorText;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  TextInputFormatter? textInputFormatter;

  CustomMobileTextField(
      {Key? key,
        this.controller,
        this.maxLength,
        this.initialText,
        this.keyboardType,
        this.textCapitalization,
        this.hintText,
        this.hintStyle,
        this.onChanged,
        this.obscureText,
        this.maxLines,
        this.minLines,
        this.labelText,
        required this.showBorder,
        required this.isEnable,
        this.showError,
        this.suffixIcon,
        this.textInputFormatter,
        this.errorText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: TextField(
                enabled: isEnable,
                obscureText: obscureText ?? false,
                controller: controller,
                // !..value = TextEditingValue(
                //     text: initialText!,
                //     selection: TextSelection.fromPosition(
                //         TextPosition(offset: controller!.text.length))),
                style:
                style ?? const TextStyle(fontFamily: "Poppins", fontSize: 18),
                onChanged: onChanged,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                cursorColor: MyColors.ThemeColor,
                keyboardType: keyboardType ?? TextInputType.number,
                textCapitalization: textCapitalization ?? TextCapitalization.none,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  textInputFormatter  ??
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    border: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))
                        : InputBorder.none,
                    focusedBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    suffixIcon: suffixIcon,
                    disabledBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    hintText: hintText ?? "",
                    hintStyle:
                    hintStyle ?? const TextStyle(fontFamily: "Poppins"),
                    labelText: labelText ?? "",
                    labelStyle: labelStyle ??
                        const TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 80, 79, 79))),
              ),
            ),
            // Visibility(
            //   visible: errorText != "",
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //         left: 8.0,
            //         top: 5.0,
            //       ),
            //       child: Text(
            //         errorText ?? "",
            //         style: const TextStyle(
            //             fontFamily: 'Poppins', color: Colors.red, fontSize: 12),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomDropDownTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? style;
  String? labelText;
  TextStyle? labelStyle;
  bool? obscureText;
  Function(String)? onChanged;
  int? maxLines;
  int? minLines;
  int? maxLength;
  String? initialText = '';
  bool showBorder = true;
  bool isEnable = true;
  bool? showError = true;
  Widget? suffixIcon;
  String? errorText;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  TextInputFormatter? textInputFormatter;

  CustomDropDownTextField(
      {Key? key,
        this.controller,
        this.maxLength,
        this.keyboardType,
        this.initialText,
        this.textCapitalization,
        this.hintText,
        this.hintStyle,
        this.onChanged,
        this.obscureText,
        this.maxLines,
        this.minLines,
        this.labelText,
        required this.showBorder,
        required this.isEnable,
        this.showError,
        this.suffixIcon,
        this.textInputFormatter,
        this.errorText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: TextField(
                enabled: isEnable,
                obscureText: obscureText ?? false,
                controller: controller,
                // !..value = TextEditingValue(
                //    // text: initialText ?? '',
                //     selection: TextSelection.fromPosition(
                //         TextPosition(offset: controller!.text.length))),
                style:
                style ?? const TextStyle(fontFamily: "Poppins", fontSize: 18),
                onChanged: onChanged,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                cursorColor: MyColors.ThemeColor,
                keyboardType: keyboardType ?? TextInputType.text,
                textCapitalization: textCapitalization ?? TextCapitalization.none,
                inputFormatters: [
                  textInputFormatter ?? LengthLimitingTextInputFormatter(100)
                ],
                decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    border: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))
                        : InputBorder.none,
                    focusedBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: MyColors.ThemeColor, size: 26.r,),
                    disabledBorder: showBorder
                        ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500))
                        : InputBorder.none,
                    hintText: hintText ?? "",
                    hintStyle:
                    hintStyle ?? const TextStyle(fontFamily: "Poppins"),
                    labelText: labelText ?? "",
                    labelStyle: labelStyle ??
                        const TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 80, 79, 79))),
              ),
            ),
            // Visibility(
            //   visible: errorText != "",
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //         left: 8.0,
            //         top: 5.0,
            //       ),
            //       child: Text(
            //         errorText ?? "",
            //         style: const TextStyle(
            //             fontFamily: 'Poppins', color: Colors.red, fontSize: 12),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
