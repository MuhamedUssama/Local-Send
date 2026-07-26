import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashTitleWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const SplashTitleWidget({
    super.key,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return FadeTransition(
      opacity: fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'LocalSend',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.8,
              color: textTheme.headlineLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'High-Speed Local File Sharing',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textTheme.bodyMedium?.color,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
