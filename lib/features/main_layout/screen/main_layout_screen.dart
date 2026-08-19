import 'package:flutter/material.dart';
import 'package:local_send/core/utils/adaptive_helper.dart';
import 'package:local_send/features/history_tab/presentation/screens/history_tab.dart';
import 'package:local_send/features/main_layout/widgets/main_layout_app_bar.dart';
import 'package:local_send/features/receive_tab/presentation/screens/receive_tab.dart';
import 'package:local_send/features/send_tab/presentation/screens/send_tab.dart';
import 'package:local_send/features/settings_tab/presentation/screens/settings_tab.dart';
import '../widgets/desktop_nav_rail.dart';
import '../widgets/mobile_bottom_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> tabs = const [
    ReceiveTab(),
    SendTab(),
    HistoryTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDesktopOrTablet = context.isTabletOrDesktop;

    return Scaffold(
      appBar: isDesktopOrTablet ? null : const MainLayoutAppBar(),
      body: isDesktopOrTablet
          ? Row(
              children: [
                DesktopNavRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: _onTabSelected,
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: colorScheme.outline.withValues(alpha: 0.15),
                ),
                Expanded(child: tabs[_currentIndex]),
              ],
            )
          : tabs[_currentIndex],
      bottomNavigationBar: isDesktopOrTablet
          ? null
          : MobileBottomNavBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: _onTabSelected,
            ),
    );
  }
}
