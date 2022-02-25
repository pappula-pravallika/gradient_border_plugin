import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  GradientBorder({Key? key,
    required gradient,
    required this.child,
    this.strokeWidth = 2,
    this.borderRadius = 80,
    this.padding = const EdgeInsets.all(5.0),
  }) : painter = GradientPainter(
      gradient: gradient, strokeWidth: strokeWidth, borderRadius: borderRadius
  ), super(key: key);
  final GradientPainter painter;
  final Widget child;
  final double strokeWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: painter,
        child: Container(
            padding: padding,
            child: child
        )
    );
  }
}

class GradientPainter extends CustomPainter {
  GradientPainter({required this.gradient, required this.strokeWidth, required this.borderRadius});
  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final Paint paintObject = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(strokeWidth, strokeWidth, size.width - strokeWidth, size.height - strokeWidth);
    RRect innerRoundedRect = RRect.fromRectAndRadius(innerRect, Radius.circular(borderRadius));
    Rect outerRect = Offset.zero & size;
    RRect outerRoundedRect = RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));
    paintObject.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, paintObject);
  }
  Path _calculateBorderPath(RRect outerRRect, RRect innerRRect) {
    Path outerRectPath = Path()..addRRect(outerRRect);
    Path innerRectPath = Path()..addRRect(innerRRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}