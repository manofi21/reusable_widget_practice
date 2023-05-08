import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

import '../container_outlinet_shadow_box.dart';

class ReuUiKitOutlinedButton extends StatelessWidget {
  final String textLabel;
  final void Function()? onPressed;
  final Color color;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color textColor;
  const ReuUiKitOutlinedButton({
    super.key,
    required this.textLabel,
    this.onPressed,
    this.color = Colors.black,
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.height = 40,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onPressed,
        child: ContainerOutlinetShdowBox(
          width: width,
          height: height,
          color: color,
          child: OutlinedText(
            text: Text(
              textLabel,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                shadows: const [
                  Shadow(
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            strokes: [
              OutlinedTextStroke(color: color, width: 3),
            ],
          ),
        ),
      ),
    );
  }
}
