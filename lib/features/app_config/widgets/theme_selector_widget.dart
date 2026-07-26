import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_send/features/app_config/cubit/app_config_cubit.dart';
import 'package:local_send/features/app_config/cubit/app_config_states.dart';
import '../../../core/l10n/app_localizations.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.themeLabel,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: BlocBuilder<AppConfigCubit, AppConfigStates>(
            builder: (context, state) {
              final cubit = context.read<AppConfigCubit>();

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildThemeOption(
                    icon: IconsaxPlusBold.sun_1,
                    isSelected: !cubit.isDark,
                    onTap: () {
                      cubit.changeTheme(ThemeMode.light);
                    },
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(width: 4),
                  _buildThemeOption(
                    icon: IconsaxPlusBold.moon,
                    isSelected: cubit.isDark,
                    onTap: () {
                      cubit.changeTheme(ThemeMode.dark);
                    },
                    colorScheme: colorScheme,
                  ),
                ],
              );
            },
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
