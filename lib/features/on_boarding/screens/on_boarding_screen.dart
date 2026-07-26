import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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

  final List<OnBoardingItem> _onBoardingItems = const [
    OnBoardingItem(
      icon: IconsaxPlusBold.wifi,
      badgeText: 'Fast & Local',
      title: 'Instant Local File Sharing',
      description:
          'Share photos, videos, and documents directly to devices on your local Wi-Fi network at maximum speed.',
    ),
    OnBoardingItem(
      icon: IconsaxPlusBold.shield_security,
      badgeText: 'Encrypted & Private',
      title: 'End-to-End Peer Security',
      description:
          'Your files remain completely private. Transfers are encrypted and transmitted directly without touching cloud servers.',
    ),
    OnBoardingItem(
      icon: IconsaxPlusBold.devices,
      badgeText: 'Cross Platform',
      title: 'Universal Device Support',
      description:
          'Connect and share effortlessly across Android, iOS, Windows, macOS, and Linux without restrictions.',
    ),
  ];

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
    Navigator.pushReplacementNamed(context, RoutesName.home);
  }

  void _onNext() {
    if (_currentIndex < _onBoardingItems.length - 1) {
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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header (Logo & Skip)
            OnBoardingHeader(
              onSkip: _navigateToHome,
            ),

            // Page View Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onBoardingItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingPageWidget(
                    item: _onBoardingItems[index],
                  );
                },
              ),
            ),

            // Bottom Actions (Indicators & Next/Start Button)
            OnBoardingBottomActions(
              itemCount: _onBoardingItems.length,
              currentIndex: _currentIndex,
              onNext: _onNext,
            ),
          ],
        ),
      ),
    );
  }
}
