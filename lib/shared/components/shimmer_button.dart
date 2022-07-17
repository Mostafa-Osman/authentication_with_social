import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const ShimmerButton({
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      child: GestureDetector(
        onTap: onPressed ??
            () => showToast(message: 'please wait', state: ToastStates.warning),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          width: width ?? 220,
          height: height ?? 48,
        ),
      ),
    );
  }
}
