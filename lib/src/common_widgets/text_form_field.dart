import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    required this.textFormController,
    required this.maxLength,
    required this.hintText,
    this.maxLines,
    required this.onChanged,
    super.key,
  });

  TextEditingController textFormController;
  String hintText;
  int maxLength;
  int? maxLines;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormController,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          border: InputBorder.none,
          fillColor: Colors.transparent,
          counterText: ""),
      autofocus: false,
      cursorColor: AppColor.primaryColor,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }
}

class TextFormFieldWithoutMaxLengthWidget extends StatelessWidget {
  TextFormFieldWithoutMaxLengthWidget({
    required this.textFormController,
    required this.hintText,
    this.maxLines,
    required this.onChanged,
    super.key,
  });

  TextEditingController textFormController;
  String hintText;
  int? maxLines;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormController,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          border: InputBorder.none,
          fillColor: Colors.transparent,
          counterText: ""),
      autofocus: false,
      keyboardType: TextInputType.multiline,
      cursorColor: AppColor.primaryColor,
      onChanged: onChanged,
      maxLines: maxLines,
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.hint,
    super.key,
    this.error,
    this.obscureText = false,
    this.textStyle,
    this.hintStyle,
    this.decoration,
    this.keyboardAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.obscuringCharacter,
    this.onTap,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.initValue,
    this.onSubmitted,
    this.paddingLeft = false,
    this.contentPadding,
    this.prefixIcon,
    this.onSaved,
    this.prefixText,
    this.maxLines = 1,
    this.minLise = 1,
    this.hintMaxLines = 1,
    this.height = 1,
    this.filled = true,
    this.fillColor = Colors.transparent,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.errorText,
    this.buildCounter,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.isDense,
    this.autocorrect = true,
    this.borderRadius,
    this.cursorColor,
    this.enableSuggestions,
    this.autovalidateMode,
    this.borderColor,
    this.addDisabledBorder = false,
  });

  final String label;
  final String hint;
  final String? prefixText;
  final String? errorText;
  final String? error;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final TextInputAction keyboardAction;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon;
  final String? initValue;
  final FormFieldSetter<String>? onSaved;
  final bool paddingLeft;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final int hintMaxLines;
  final int minLise;
  final double height;
  final bool filled;
  final Color fillColor;
  final Widget? suffix;
  final Widget? prefix;
  final ValueSetter<String?>? onChanged;
  final VoidCallback? onSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final bool? autocorrect;
  final String? obscuringCharacter;
  final double? borderRadius;
  final Color? cursorColor;
  final Color? borderColor;
  final bool? enableSuggestions;
  final bool addDisabledBorder;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autocorrect ?? true,
      enableSuggestions: enableSuggestions ?? true,
      initialValue: initValue,
      onSaved: onSaved,
      cursorColor: cursorColor ?? Colors.black,
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      minLines: minLise,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
      obscuringCharacter: obscuringCharacter ?? '*',
      style: textStyle ?? Theme.of(context).textTheme.labelMedium,
      obscureText: obscureText,
      validator: validators ??
          (value) {
            return null;
          },
      keyboardType: keyboardType,
      textInputAction: keyboardAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: (_) => submit(context),
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      decoration: decoration ??
          InputDecoration(
            counterStyle: TextStyle(color: AppColor.textColor.withOpacity(0.50)),
            counterText: '',
            prefixText: prefixText,
            isDense: isDense,
            prefix: prefix,
            prefixStyle: TextStyle(color: Colors.black),
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            filled: filled,
            fillColor: fillColor,
            hintText: hint,
            hintMaxLines: hintMaxLines,
            suffixIcon: suffixIcon,
            suffix: suffix,
            suffixIconConstraints: suffixIconConstraints,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            errorStyle: TextStyle(
              fontSize: 14,
            ),
            errorMaxLines: 2,
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            alignLabelWithHint: true,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: (borderColor != null) ? BorderSide(color: borderColor!, width: 0.5) : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: (borderColor != null) ? BorderSide(color: borderColor!, width: 0.5) : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: addDisabledBorder ? BorderSide(color: borderColor ?? AppColor.textLightGreyColor) : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
    );
  }

  void submit(BuildContext context) {
    onSubmitted?.call();
    switch (keyboardAction) {
      case TextInputAction.done:
        FocusScope.of(context).unfocus();
      case TextInputAction.next:
        FocusScope.of(context).requestFocus(nextFocusNode);
      // ignore: no_default_cases
      default:
        FocusScope.of(context).nextFocus();
    }
  }
}
