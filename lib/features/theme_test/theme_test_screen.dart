import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../core/l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';

class ThemeTestScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final VoidCallback onToggleLanguage;
  final Locale currentLocale;

  const ThemeTestScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
    required this.onToggleLanguage,
    required this.currentLocale,
  });

  @override
  State<ThemeTestScreen> createState() => _ThemeTestScreenState();
}

class _ThemeTestScreenState extends State<ThemeTestScreen> {
  int _currentNavIndex = 0;
  bool _switchVal = true;
  bool _checkboxVal = true;
  double _sliderVal = 75;
  final TextEditingController _textController = TextEditingController(
    text: 'local_send_v2.0.zip',
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;
    final isArabic = widget.currentLocale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                IconsaxPlusBold.send_2,
                color: Colors.white,
                size: 20,
              ),
            ),
            Expanded(
              child: Text(l10n.appTitle, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        actions: [
          // Language Switcher Button
          InkWell(
            onTap: widget.onToggleLanguage,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    IconsaxPlusLinear.global,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isArabic ? 'English' : 'عربي',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(
              widget.isDarkMode
                  ? IconsaxPlusLinear.sun_1
                  : IconsaxPlusLinear.moon,
              color: widget.isDarkMode
                  ? AppColors.secondary
                  : AppColors.primary,
            ),
            tooltip: widget.isDarkMode
                ? l10n.switchToLightMode
                : l10n.switchToDarkMode,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // -------------------------------------------------------------------
          // 🚀 HERO BANNER CARD
          // -------------------------------------------------------------------
          Container(
            decoration: BoxDecoration(
              gradient: widget.isDarkMode
                  ? AppColors.primaryGradient
                  : const LinearGradient(
                      colors: [AppColors.primary, AppColors.secondaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            IconsaxPlusLinear.wifi,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            l10n.mdnsActive,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      IconsaxPlusLinear.scan_barcode,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.heroTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.heroSubtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 🔤 TYPOGRAPHY SHOWCASE
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.typographyHeader,
            IconsaxPlusLinear.text,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.displayMediumSample,
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.headlineLargeSample,
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(l10n.titleLargeSample, style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(l10n.bodyLargeSample, style: textTheme.bodyLarge),
                  const SizedBox(height: 4),
                  Text(l10n.bodyMediumSample, style: textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(l10n.bodySmallSample, style: textTheme.bodySmall),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 🔘 BUTTONS SHOWCASE
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.buttonsHeader,
            IconsaxPlusLinear.element_3,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.send_2, size: 18),
                    label: Text(l10n.sendFiles),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.import, size: 18),
                    label: Text(l10n.receive),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.radar_2, size: 18),
                    label: Text(l10n.scanDevices),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.clock, size: 18),
                    label: Text(l10n.viewHistory),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 📱 DEVICE LISTTILE & CARDS
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.devicesHeader,
            IconsaxPlusLinear.devices,
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.monitor,
                      color: AppColors.secondary,
                    ),
                  ),
                  title: Text(l10n.macbookName),
                  subtitle: Text(l10n.macbookSubtitle),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mintGreen.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.mintGreen.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      l10n.statusReady,
                      style: const TextStyle(
                        color: AppColors.mintGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Divider(indent: 72),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.mobile,
                      color: AppColors.secondary,
                    ),
                  ),
                  title: Text(l10n.iphoneName),
                  subtitle: Text(l10n.iphoneSubtitle),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.coralPulse.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.coralPulse.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      l10n.statusSending,
                      style: const TextStyle(
                        color: AppColors.coralPulse,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 📊 PROGRESS INDICATORS & STREAMING
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.streamingHeader,
            IconsaxPlusLinear.flash_1,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          l10n.chunkedProgressTitle,
                          style: textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.progressSample,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const LinearProgressIndicator(
                      value: 0.78,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        l10n.transferSpeedLabel,
                        style: textTheme.bodyMedium,
                      ),
                      Text(
                        l10n.speedSample,
                        style: const TextStyle(
                          color: AppColors.mintGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // ⚙️ INPUTS & CONTROLS
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.controlsHeader,
            IconsaxPlusLinear.setting_4,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: l10n.fileRenameLabel,
                      hintText: l10n.fileRenameHint,
                      prefixIcon: const Icon(IconsaxPlusLinear.document_text),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: Text(l10n.autoAcceptTitle),
                    subtitle: Text(l10n.autoAcceptSubtitle),
                    value: _switchVal,
                    onChanged: (val) => setState(() => _switchVal = val),
                  ),
                  CheckboxListTile(
                    title: Text(l10n.quickQrTitle),
                    subtitle: Text(l10n.quickQrSubtitle),
                    value: _checkboxVal,
                    onChanged: (val) =>
                        setState(() => _checkboxVal = val ?? false),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.bandwidthLimitTitle(_sliderVal.toInt().toString()),
                    style: textTheme.titleMedium,
                  ),
                  Slider(
                    value: _sliderVal,
                    min: 10,
                    max: 200,
                    divisions: 19,
                    label: '${_sliderVal.toInt()} MB/s',
                    onChanged: (val) => setState(() => _sliderVal = val),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 🏷️ CHIPS & BADGES
          // -------------------------------------------------------------------
          _buildSectionHeader(context, l10n.chipsHeader, IconsaxPlusLinear.tag),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(IconsaxPlusLinear.archive, size: 16),
                label: Text(l10n.archiveChip),
                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              ),
              Chip(
                avatar: const Icon(IconsaxPlusLinear.gallery, size: 16),
                label: Text(l10n.photosChip),
                backgroundColor: AppColors.secondary.withValues(alpha: 0.12),
              ),
              Chip(
                avatar: const Icon(IconsaxPlusLinear.video_play, size: 16),
                label: Text(l10n.videoChip),
                backgroundColor: AppColors.secondary.withValues(alpha: 0.12),
              ),
              ActionChip(label: Text(l10n.addCategoryChip), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 💬 MODALS & SHEETS
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            l10n.modalsHeader,
            IconsaxPlusLinear.maximize_3,
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              OutlinedButton.icon(
                onPressed: () => _showTestDialog(context, l10n),
                icon: const Icon(IconsaxPlusLinear.export_1),
                label: Text(l10n.openDialog),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () => _showTestBottomSheet(context, l10n),
                icon: const Icon(IconsaxPlusLinear.arrow_up_3),
                label: Text(l10n.bottomSheet),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(
                    IconsaxPlusBold.tick_circle,
                    color: AppColors.mintGreen,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(l10n.snackBarSuccess),
                ],
              ),
            ),
          );
        },
        icon: const Icon(IconsaxPlusBold.magicpen),
        label: Text(l10n.testSnackbar),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentNavIndex,
        onDestinationSelected: (index) =>
            setState(() => _currentNavIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.send_2),
            selectedIcon: const Icon(IconsaxPlusBold.send_2),
            label: l10n.navSend,
          ),
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.import),
            selectedIcon: const Icon(IconsaxPlusBold.import),
            label: l10n.navReceive,
          ),
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.clock),
            selectedIcon: const Icon(IconsaxPlusBold.clock),
            label: l10n.navHistory,
          ),
          NavigationDestination(
            icon: const Icon(IconsaxPlusLinear.setting),
            selectedIcon: const Icon(IconsaxPlusBold.setting),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(title, style: theme.textTheme.headlineSmall),
      ],
    );
  }

  void _showTestDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(
              IconsaxPlusBold.security_safe,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 10),
            Text(l10n.incomingConnectionTitle),
          ],
        ),
        content: Text(l10n.incomingConnectionContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.decline),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.acceptAndSave),
          ),
        ],
      ),
    );
  }

  void _showTestBottomSheet(BuildContext context, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.quickTransferOptionsTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                IconsaxPlusLinear.document_copy,
                color: AppColors.primary,
              ),
              title: Text(l10n.shareClipboardTitle),
              subtitle: Text(l10n.shareClipboardSubtitle),
              onTap: () => Navigator.pop(ctx),
            ),
            ListTile(
              leading: const Icon(
                IconsaxPlusLinear.scan_barcode,
                color: AppColors.secondary,
              ),
              title: Text(l10n.generateQrTitle),
              subtitle: Text(l10n.generateQrSubtitle),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }
}
