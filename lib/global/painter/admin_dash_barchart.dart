import 'package:flutter/material.dart';

class AdminBarChartPainter extends CustomPainter {
  final List<BarChartItem> data;
  final List<BarChartItem> data2;
  final String month1Label;
  final String month2Label;

  AdminBarChartPainter({
    required this.data,
    required this.data2,
    required this.month1Label,
    required this.month2Label,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final barWidth = size.width / (data.length * 2 + 1); // Calculate bar width
    final gap = barWidth * 0.2; // Gap between bars

    var x = gap;
    for (var i = 0; i < data.length; i++) {
      final barHeight = (data[i].value / 100) * size.height; // Scale bar height

      // Draw bar for Month 1
      canvas.drawRect(
        Rect.fromLTWH(x, size.height - barHeight, barWidth - gap, barHeight),
        paint..color = data[i].color,
      );

      x += barWidth + gap; // Move to next bar position

      // Draw bar for Month 2
      canvas.drawRect(
        Rect.fromLTWH(x, size.height - barHeight, barWidth - gap, barHeight),
        paint..color = data2[i].color, // Set bar color for Month 2
      );

      x += barWidth + gap; // Move to next bar position
    }

    // Draw labels for months
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Draw label for Month 1
    textPainter.text = TextSpan(
      text: month1Label,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(gap, size.height - textPainter.height));

    // Draw label for Month 2
    textPainter.text = TextSpan(
      text: month2Label,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(x + barWidth + gap - textPainter.width,
            size.height - textPainter.height));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class BarChartItem {
  final double value;
  final Color color;

  BarChartItem({required this.value, required this.color});
}
