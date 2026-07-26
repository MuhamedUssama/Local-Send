import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_send/features/app_config/cubit/app_config_cubit.dart';
import 'package:local_send/features/app_config/cubit/app_config_states.dart';
import '../../../core/l10n/app_localizations.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

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
          l10n.languageLabel,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: BlocBuilder<AppConfigCubit, AppConfigStates>(
            buildWhen: (previous, current) {
              return previous.locale != current.locale;
            },
            builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLanguageOption(
                    label: l10n.languageEnglish,
                    code: 'en',
                    isSelected: state.locale.languageCode == 'en',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    context: context,
                  ),
                  const SizedBox(width: 4),
                  _buildLanguageOption(
                    label: l10n.languageArabic,
                    code: 'ar',
                    isSelected: state.locale.languageCode == 'ar',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    context: context,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageOption({
    required String label,
    required String code,
    required bool isSelected,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<AppConfigCubit>().changeLocale(code);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: textTheme.labelLarge?.copyWith(
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
