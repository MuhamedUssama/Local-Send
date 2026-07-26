import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashProgressWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const SplashProgressWidget({
    super.key,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeTransition(
      opacity: fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                minHeight: 4,
                color: theme.colorScheme.primary,
                backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Initializing network discovery...',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }
}
