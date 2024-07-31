import 'package:flutter/material.dart';
import 'package:task_app/product/extensions/context_extensions.dart';

class CustomGeneralButtonWidget extends StatelessWidget {
  const CustomGeneralButtonWidget({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    this.buttonColor,
    this.buttonBorderColor = Colors.transparent,
    this.text,
    this.textStyle,
    this.borderRadius = 8,
    this.enabled = true,
    this.isLinear = false,
    this.linearGradient,
  });

  final void Function()? onTap;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color buttonBorderColor;
  final String? text;
  final TextStyle? textStyle;
  final double? borderRadius;
  final bool enabled;
  final bool isLinear;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: width ?? context.dynamicWidth(0.5),
        height: height ?? context.dynamicHeight(0.064),
        decoration: BoxDecoration(
          gradient: isLinear ? linearGradient : null,
          color: isLinear ? null : buttonColor ?? context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          border: Border.all(color: buttonBorderColor),
        ),
        alignment: Alignment.center,
        child: Text(
          text ?? '',
          style: textStyle ??
              context.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.background,
              ),
        ),
      ),
    );
  }
}
