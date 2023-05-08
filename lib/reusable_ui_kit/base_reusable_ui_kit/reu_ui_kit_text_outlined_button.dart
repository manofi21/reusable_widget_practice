import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

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
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(3, 6),
              )
            ],
          ),
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: color, width: 1.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: OutlinedText(
              text: Text(
                textLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  shadows: const  [
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
        ));
  }
}
