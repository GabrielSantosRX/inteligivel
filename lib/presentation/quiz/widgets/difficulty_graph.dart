import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:inteligivel/util/app_colors.dart';

class DifficultyGraph extends StatelessWidget {
  final int count;

  const DifficultyGraph({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Parallelogram(
        cutLength: 10.0,
        edge: Edge.RIGHT,
        child: Container(
          color: AppColors.cgBlue,
          width: 25.0,
          height: 10.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 0 ? AppColors.cgBlue : AppColors.culturedGrey,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 1 ? AppColors.cgBlue : AppColors.culturedGrey,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
    ]);
  }
}
