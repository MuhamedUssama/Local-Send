import 'package:flutter/material.dart';
import 'package:local_send/core/l10n/app_localizations.dart';
import 'main_nav_item.dart';

class MobileBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const MobileBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = MainNavItem.items;

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: items.map((item) {
        final label = item.labelBuilder(l10n);
        return NavigationDestination(
          icon: Icon(item.unselectedIcon),
          selectedIcon: Icon(item.selectedIcon),
          label: label,
        );
      }).toList(),
    );
  }
}
