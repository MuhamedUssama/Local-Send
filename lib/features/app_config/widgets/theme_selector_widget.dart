import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ThemeSelectorWidget extends StatefulWidget {
  const ThemeSelectorWidget({super.key});

  @override
  State<ThemeSelectorWidget> createState() => _ThemeSelectorWidgetState();
}

class _ThemeSelectorWidgetState extends State<ThemeSelectorWidget> {
  // Local UI state for demonstration (user will hook logic later)
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Theme',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption(
                icon: IconsaxPlusBold.sun_1,
                isSelected: !_isDark,
                onTap: () {
                  setState(() {
                    _isDark = false;
                  });
                },
                colorScheme: colorScheme,
              ),
              const SizedBox(width: 4),
              _buildThemeOption(
                icon: IconsaxPlusBold.moon,
                isSelected: _isDark,
                onTap: () {
                  setState(() {
                    _isDark = true;
                  });
                },
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeOption({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected
              ? colorScheme.onPrimary
              : colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
