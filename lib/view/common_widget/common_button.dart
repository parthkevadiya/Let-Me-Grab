import 'package:flutter/material.dart';
import 'package:letmegrab/utils/indicator.dart';
import 'package:letmegrab/view/common_widget/common_text.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final Color? buttonColor;
  final double? height;
  final void Function()? onPressed;
  final double? labelSize;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? buttonRadius;
  final String? labelLogo;
  final Color? buttonBorderColor;
  final bool? load;

  const CommonButton(
      {Key? key,
      this.label,
      this.buttonColor,
      this.height,
      this.onPressed,
      this.labelSize,
      this.labelColor,
      this.labelWeight,
      this.buttonRadius,
      this.labelLogo,
      this.buttonBorderColor,
      this.load})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height,
      color: buttonColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: buttonBorderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(buttonRadius ?? 8),
      ),
      child: load ?? false
          ? ProgressView()
          : CommonText(
              text: label ?? "",
              fontSize: labelSize,
              color: labelColor,
              fontWeight: labelWeight,
              textAlign: TextAlign.center,
            ),
    );
  }
}
