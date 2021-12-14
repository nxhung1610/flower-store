import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final ShapeBorder shape;
  final double? height;
  final double? width;
  final Color? baseColor;
  final Color? highlightColor;
  ShimmerWidget(
      {Key? key,
      this.height,
      this.width,
      this.baseColor,
      this.highlightColor,
      this.shape = const RoundedRectangleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: shape,
          ),
        ),
        direction: ShimmerDirection.ltr,
        baseColor: baseColor ?? AppColors.color9.withOpacity(0.8),
        highlightColor: highlightColor ?? AppColors.color9.withOpacity(0.5),
      ),
    );
  }
}
