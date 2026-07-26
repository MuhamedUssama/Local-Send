import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../core/theme/app_colors.dart';

class SplashLogoWidget extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> pulseAnimation;

  const SplashLogoWidget({
    super.key,
    required this.scaleAnimation,
    required this.pulseAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: AnimatedBuilder(
        animation: pulseAnimation,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(
                    alpha: 0.25 + (pulseAnimation.value * 0.2),
                  ),
                  blurRadius: 30 + (pulseAnimation.value * 15),
                  spreadRadius: 2 + (pulseAnimation.value * 6),
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              IconsaxPlusBold.send_2,
              color: Colors.white,
              size: 56,
            ),
          );
        },
      ),
    );
  }
}
