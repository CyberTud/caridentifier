import 'package:flutter/material.dart';

class ConfidenceChip extends StatelessWidget {
  final double confidence;

  const ConfidenceChip({
    super.key,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final percentage = (confidence * 100).toInt();

    Color getConfidenceColor() {
      if (confidence >= 0.8) return Colors.green;
      if (confidence >= 0.6) return Colors.orange;
      return Colors.red;
    }

    String getConfidenceText() {
      if (confidence >= 0.8) return 'High';
      if (confidence >= 0.6) return 'Medium';
      return 'Low';
    }

    final confidenceColor = getConfidenceColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: confidenceColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: confidenceColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: confidenceColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$percentage% ${getConfidenceText()}',
            style: theme.textTheme.labelSmall?.copyWith(
              color: confidenceColor.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}