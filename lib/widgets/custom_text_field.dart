import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final bool isObsecure;
  final int? maxLines;
  final TextInputType? type;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    super.key,
    required this.title,
    this.prefix,
    this.suffix,
    this.controller,
    this.validation,
    this.isObsecure = false,
    this.maxLines = 1,
    this.type,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return TextFormField(
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Theme.of(context).cardColor,
      keyboardType: type,
      maxLines: maxLines,
      obscureText: isObsecure,
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: height * 0.015,
        ),
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        hintText: title,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(
            start: width * 0.035,
            end: width * 0.01,
          ),
          child: prefix,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0),
        suffixIcon: suffix,
        suffixIconConstraints: BoxConstraints(minWidth: 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
          borderRadius: .circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
          borderRadius: .circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: .circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: .circular(16),
        ),
      ),
    );
  }
}
