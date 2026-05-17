import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MovieDescription extends StatefulWidget {
  final String description;

  const MovieDescription({super.key, required this.description});

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.grey.shade700,
      fontSize: 14,
      height: 1.4,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(text: widget.description, style: textStyle);

        final tp = TextPainter(
          text: textSpan,
          maxLines: 3,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        if (!isOverflowing) {
          /// 🔹 SHORT TEXT → NORMAL
          return Text(widget.description, style: textStyle);
        }

        /// 🔹 LONG TEXT → INLINE "MORE"
        return RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: isExpanded
                    ? widget.description
                    : _truncateText(widget.description, 120),
              ),

              TextSpan(
                text: isExpanded ? '  Read less' : ' Read more',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
              ),
            ],
          ),
        );
      },
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength) + '...';
  }
}
