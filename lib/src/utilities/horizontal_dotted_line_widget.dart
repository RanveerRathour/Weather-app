import 'package:flutter/material.dart';

class HorizontalDottedLine extends StatelessWidget {
  final double thickness;
  final double lineLength;
  final Color color;
  final double dashWidth;
  final double dashSpacing;

  const HorizontalDottedLine({
    super.key,
    required this.thickness,
    required this.lineLength,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashSpacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomDashedLinePainter(
        color: color,
        dashWidth: dashWidth,
        dashSpacing: dashSpacing,
        thickness: thickness,
      ),
      child: SizedBox(
        height: thickness,
        width: lineLength,
      ),
    );
  }
}

class CustomDashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpacing;
  final double thickness;

  CustomDashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpacing,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = thickness;

    final double endX = size.width;

    for (double x = 0; x < endX; x += dashWidth + dashSpacing) {
      canvas.drawLine(
        Offset(x, size.height / 2),
        Offset(x + dashWidth, size.height / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
