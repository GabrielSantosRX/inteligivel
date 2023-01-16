import 'package:flutter/material.dart';
import 'package:inteligivel/util/app_colors.dart';

class AnimatedBorder extends StatelessWidget {
  const AnimatedBorder({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: MyPainter(value: animation.value),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          );
        },
      );
    });
  }
}

class MyPainter extends CustomPainter {
  final double value;

  MyPainter({required this.value});

  final paintBorder = Paint()
    ..color = AppColors.battleshipGrey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final transparentBorder = Paint()
    ..color = Colors.transparent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    if (value < 15) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width * 15 / 100, 0);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width * 15 / 100, 0);

    if (value >= 15 && value <= 85) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, transparentBorder);
      return;
    } else {
      path.lineTo(size.width * 85 / 100, 0);
      canvas.drawPath(path, transparentBorder);
    }

    path = Path();
    path.moveTo(size.width * 85 / 100, 0);

    if (value > 85 && value < 100) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, 0);
      canvas.drawPath(path, paintBorder);
    }

    if (value < 200) {
      double lineValue = size.height * (value - 100) / 100;
      path.lineTo(size.width, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width, size.height);

    if (value < 300) {
      double lineValue = size.width - size.width * (value - 200) / 100;
      path.lineTo(lineValue, size.height);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(0, size.height);

    if (value < 400) {
      double lineValue = size.height - size.height * (value - 300) / 100;
      path.lineTo(0, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, 0);
      canvas.drawPath(path, paintBorder);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
