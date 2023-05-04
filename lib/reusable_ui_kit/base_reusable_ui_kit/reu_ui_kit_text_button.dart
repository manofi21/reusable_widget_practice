import 'package:flutter/material.dart';

import '../container_solid_shadow_box.dart';

class ReuUiKitButton extends StatelessWidget {
  final String textLabel;
  final void Function()? onPressed;
  final Color color;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color textColor;
  const ReuUiKitButton({
    super.key,
    required this.textLabel,
    this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.height = 40,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerSolidShadowBox(
      color: color,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
