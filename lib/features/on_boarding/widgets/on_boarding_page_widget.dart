import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../models/on_boarding_item.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final OnBoardingItem item;

  const OnBoardingPageWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          // Hero Icon Illustration Card with animate_do ZoomIn
          ZoomIn(
            key: ValueKey('icon_${item.title}'),
            duration: const Duration(milliseconds: 600),
            child: Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.25),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.12),
                      blurRadius: 30,
                      spreadRadius: 4,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary.withValues(alpha: 0.88),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.35),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        item.icon,
                        size: 96,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Subtitle Badge Tag
          FadeInUp(
            key: ValueKey('badge_${item.title}'),
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 150),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.secondary.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                item.badgeText.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Title
          FadeInUp(
            key: ValueKey('title_${item.title}'),
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 250),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge?.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.6,
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Description
          FadeInUp(
            key: ValueKey('desc_${item.title}'),
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 350),
            child: Text(
              item.description,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
