import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.color_FFFFFF
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);

    path.quadraticBezierTo(0, 0, size.width * .40, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 0.2);
    path.arcToPoint(
      Offset(size.width * .60, 20),
      radius: const Radius.circular(10.0),
      clockwise: false,
    );

    path.quadraticBezierTo(size.width * .60, 0, size.width * .60, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
