import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../core/l10n/app_localizations.dart';
import 'on_boarding_indicator.dart';

class OnBoardingBottomActions extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final VoidCallback onNext;

  const OnBoardingBottomActions({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isLastPage = currentIndex == itemCount - 1;

    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 28,
          right: 28,
          bottom: 36,
          top: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnBoardingIndicator(
              itemCount: itemCount,
              currentIndex: currentIndex,
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onNext,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isLastPage ? l10n.getStarted : l10n.next),
                    const SizedBox(width: 8),
                    Icon(
                      isLastPage
                          ? IconsaxPlusBold.send_2
                          : Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
