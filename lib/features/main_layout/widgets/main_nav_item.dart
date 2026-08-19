import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_send/core/l10n/app_localizations.dart';

/// Navigation item definition for LocalSend navigation destinations.
class MainNavItem {
  final IconData unselectedIcon;
  final IconData selectedIcon;
  final String Function(AppLocalizations l10n) labelBuilder;

  const MainNavItem({
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.labelBuilder,
  });

  static List<MainNavItem> get items => const [
    MainNavItem(
      unselectedIcon: IconsaxPlusLinear.direct_inbox,
      selectedIcon: IconsaxPlusBold.direct_inbox,
      labelBuilder: _receiveLabel,
    ),
    MainNavItem(
      unselectedIcon: IconsaxPlusLinear.send_2,
      selectedIcon: IconsaxPlusBold.send_2,
      labelBuilder: _sendLabel,
    ),
    MainNavItem(
      unselectedIcon: IconsaxPlusLinear.clock_1,
      selectedIcon: IconsaxPlusBold.clock,
      labelBuilder: _historyLabel,
    ),
    MainNavItem(
      unselectedIcon: IconsaxPlusLinear.setting_2,
      selectedIcon: IconsaxPlusBold.setting_2,
      labelBuilder: _settingsLabel,
    ),
  ];

  static String _receiveLabel(AppLocalizations l10n) => l10n.navReceive;
  static String _sendLabel(AppLocalizations l10n) => l10n.navSend;
  static String _historyLabel(AppLocalizations l10n) => l10n.navHistory;
  static String _settingsLabel(AppLocalizations l10n) => l10n.navSettings;
}
