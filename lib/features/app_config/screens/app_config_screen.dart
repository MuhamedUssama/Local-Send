import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../core/router/routes_name.dart';
import '../widgets/app_config_hero_widget.dart';
import '../widgets/language_selector_widget.dart';
import '../widgets/theme_selector_widget.dart';

class AppConfigScreen extends StatelessWidget {
  const AppConfigScreen({super.key});

  void _onLetStart(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.onBoarding);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              // Hero Illustration Logo
              const AppConfigHeroWidget(),

              const Spacer(),
              // Title
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 150),
                child: Text(
                  'Personalize Your Experience',
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    height: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle Description
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 250),
                child: Text(
                  'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Language Selector
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 350),
                child: const LanguageSelectorWidget(),
              ),

              const SizedBox(height: 20),

              // Theme Selector
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 450),
                child: const ThemeSelectorWidget(),
              ),

              const SizedBox(height: 32),

              // Action Button "Let's start"
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 550),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => _onLetStart(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Let's start"),
                        const SizedBox(width: 8),
                        Icon(
                          IconsaxPlusLinear.arrow_right_3,
                          size: 20,
                          color: colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
