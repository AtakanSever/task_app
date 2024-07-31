import 'package:flutter/material.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.inputType,
    super.key,
    this.hintText,
    this.hintStyle,
    this.prefixWidget,
    this.obscureText = false,
    this.suffixWidget,
    this.validator,
    this.labelText,
    this.enabled = true,
    this.onChanged,
    this.maxLength,
    this.filled = false,
    this.fillColor,
    this.focusNode,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.textSpan,
    this.maxLines = 1, // Default value to 1
  }) : assert(!obscureText || maxLines == 1, 
              'Obscured fields cannot be multiline.');

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType inputType;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool filled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final IconData? prefixIcon;
  final String? textSpan;
  final int? maxLines;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: labelText ?? '',
                  style: context.theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.scrim,
                  ),
                ),
                const TextSpan(
                  text: '  ',
                ),
                if (textSpan != null)
                  TextSpan(
                      text: textSpan,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.theme.colorScheme.onPrimaryContainer,
                        fontSize: 10,
                      )),
              ],
            ),
          ),
        const VerticalSpace.xxSmall(),
        Container(
          height: context.dynamicHeight(0.07),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.theme.colorScheme.surfaceTint
          ),
          child: TextFormField(
            maxLines: obscureText ? 1 : maxLines,
            validator: validator,
            focusNode: focusNode,
            onChanged: onChanged,
            maxLength: maxLength,
            enabled: enabled,
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType,
            style: context.theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: prefixWidget,
              suffixIcon: suffixWidget,
              alignLabelWithHint: true,
              isDense: true,
              filled: filled,
              fillColor: fillColor,
              hintText: hintText,
              hintStyle: hintStyle,
              labelStyle: context.theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.surfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.surface,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.colorScheme.error, width: 6),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
