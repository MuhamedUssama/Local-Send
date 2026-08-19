import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/router/routes_name.dart';
import '../models/on_boarding_item.dart';
import '../widgets/on_boarding_bottom_actions.dart';
import '../widgets/on_boarding_header.dart';
import '../widgets/on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  List<OnBoardingItem> _getOnBoardingItems(AppLocalizations l10n) {
    return [
      OnBoardingItem(
        icon: IconsaxPlusBold.wifi,
        badgeText: l10n.onBoardingFastLocalBadge,
        title: l10n.onBoardingFastLocalTitle,
        description: l10n.onBoardingFastLocalDesc,
      ),
      OnBoardingItem(
        icon: IconsaxPlusBold.shield_security,
        badgeText: l10n.onBoardingEncryptedBadge,
        title: l10n.onBoardingEncryptedTitle,
        description: l10n.onBoardingEncryptedDesc,
      ),
      OnBoardingItem(
        icon: IconsaxPlusBold.devices,
        badgeText: l10n.onBoardingCrossPlatformBadge,
        title: l10n.onBoardingCrossPlatformTitle,
        description: l10n.onBoardingCrossPlatformDesc,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, RoutesName.mainlayout);
  }

  void _onNext(int itemCount) {
    if (_currentIndex < itemCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final items = _getOnBoardingItems(l10n);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header (Logo & Skip)
            OnBoardingHeader(onSkip: _navigateToHome),

            // Page View Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingPageWidget(item: items[index]);
                },
              ),
            ),

            // Bottom Actions (Indicators & Next/Start Button)
            OnBoardingBottomActions(
              itemCount: items.length,
              currentIndex: _currentIndex,
              onNext: () => _onNext(items.length),
            ),
          ],
        ),
      ),
    );
  }
}
