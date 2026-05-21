import 'package:flutter/material.dart';

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
      color: Colors.white.withOpacity(0.85),
      fontSize: 14,
      height: 1.4,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(text: widget.description, style: textStyle);

        final tp = TextPainter(
          text: textSpan,
          maxLines: 4,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 DESCRIPTION TEXT
            Text(
              widget.description,
              maxLines: isExpanded ? null : 4,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: textStyle,
            ),

            /// 🔹 READ MORE / LESS
            if (isOverflowing) ...[
              const SizedBox(height: 6),

              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Read less' : 'Read more',
                  style: const TextStyle(
                    color: Colors.white, // ✅ white
                    fontSize: 16, // ✅ bigger
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
