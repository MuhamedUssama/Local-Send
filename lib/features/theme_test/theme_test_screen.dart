import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../core/theme/app_colors.dart';

class ThemeTestScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const ThemeTestScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
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
            const SizedBox(width: 12),
            const Text('LocalSend UI Showcase'),
          ],
        ),
        actions: [
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
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            IconsaxPlusLinear.wifi,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'mDNS Active',
                            style: TextStyle(
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
                const Text(
                  'LocalSend Futuristic Theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'High-speed chunked streaming • Plus Jakarta Sans Typography',
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
            'Typography (Google Fonts)',
            IconsaxPlusLinear.text,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display Medium', style: textTheme.displayMedium),
                  const SizedBox(height: 4),
                  Text('Headline Large', style: textTheme.headlineLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Title Large (File Name.pdf)',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Body Large - Seamless transfer across local devices.',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Body Medium - 124 MB of 500 MB (45.2 MB/s)',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Body Small - 192.168.1.105:53317',
                    style: textTheme.bodySmall,
                  ),
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
            'Buttons & Actions',
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
                    label: const Text('Send Files'),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.import, size: 18),
                    label: const Text('Receive'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.radar_2, size: 18),
                    label: const Text('Scan Devices'),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusLinear.clock, size: 18),
                    label: const Text('View History'),
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
            'Device Tiles & Status Badges',
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
                  title: const Text('Mohamed’s MacBook Pro'),
                  subtitle: const Text('macOS • 192.168.1.42'),
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
                    child: const Text(
                      'Ready',
                      style: TextStyle(
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
                  title: const Text('iPhone 15 Pro Max'),
                  subtitle: const Text('iOS • 192.168.1.88'),
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
                    child: const Text(
                      'Sending 82%',
                      style: TextStyle(
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
            'Real-Time Streaming & Speed',
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
                      Text(
                        'Chunked Streaming Progress',
                        style: textTheme.titleMedium,
                      ),
                      const Text(
                        '78.4 MB / 100 MB',
                        style: TextStyle(
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
                      Text('Transfer Speed: ', style: textTheme.bodyMedium),
                      const Text(
                        '54.2 MB/s',
                        style: TextStyle(
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
            'Inputs & Interactive Controls',
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
                    decoration: const InputDecoration(
                      labelText: 'File Rename / Save Path',
                      hintText: 'Enter file name',
                      prefixIcon: Icon(IconsaxPlusLinear.document_text),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Auto-Accept Transfer Requests'),
                    subtitle: const Text(
                      'Allow known devices to send without prompt',
                    ),
                    value: _switchVal,
                    onChanged: (val) => setState(() => _switchVal = val),
                  ),
                  CheckboxListTile(
                    title: const Text('Quick QR Code Mode'),
                    subtitle: const Text('Display QR code on discovery start'),
                    value: _checkboxVal,
                    onChanged: (val) =>
                        setState(() => _checkboxVal = val ?? false),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Bandwidth Limit Rate (${_sliderVal.toInt()} MB/s)',
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
          _buildSectionHeader(
            context,
            'Tags & Category Chips',
            IconsaxPlusLinear.tag,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(IconsaxPlusLinear.archive, size: 16),
                label: const Text('Archive (.zip)'),
                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              ),
              Chip(
                avatar: const Icon(IconsaxPlusLinear.gallery, size: 16),
                label: const Text('Photos (42)'),
                backgroundColor: AppColors.secondary.withValues(alpha: 0.12),
              ),
              Chip(
                avatar: const Icon(IconsaxPlusLinear.video_play, size: 16),
                label: const Text('Video (1.4 GB)'),
                backgroundColor: AppColors.secondary.withValues(alpha: 0.12),
              ),
              ActionChip(label: const Text('+ Add Category'), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 28),

          // -------------------------------------------------------------------
          // 💬 MODALS & SHEETS
          // -------------------------------------------------------------------
          _buildSectionHeader(
            context,
            'Dialogs & Bottom Sheets',
            IconsaxPlusLinear.maximize_3,
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              OutlinedButton.icon(
                onPressed: () => _showTestDialog(context),
                icon: const Icon(IconsaxPlusLinear.export_1),
                label: const Text('Open Dialog'),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () => _showTestBottomSheet(context),
                icon: const Icon(IconsaxPlusLinear.arrow_up_3),
                label: const Text('Bottom Sheet'),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Icon(
                    IconsaxPlusBold.tick_circle,
                    color: AppColors.mintGreen,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text('LocalSend theme verified successfully! 🚀'),
                ],
              ),
            ),
          );
        },
        icon: const Icon(IconsaxPlusBold.magicpen),
        label: const Text('Test SnackBar'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentNavIndex,
        onDestinationSelected: (index) =>
            setState(() => _currentNavIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.send_2),
            selectedIcon: Icon(IconsaxPlusBold.send_2),
            label: 'Send',
          ),
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.import),
            selectedIcon: Icon(IconsaxPlusBold.import),
            label: 'Receive',
          ),
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.clock),
            selectedIcon: Icon(IconsaxPlusBold.clock),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.setting),
            selectedIcon: Icon(IconsaxPlusBold.setting),
            label: 'Settings',
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

  void _showTestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(IconsaxPlusBold.security_safe, color: AppColors.secondary),
            SizedBox(width: 10),
            Text('Incoming Connection'),
          ],
        ),
        content: const Text(
          'MacBook Pro wants to send "presentation_final.pdf" (24.5 MB). Do you accept this transfer?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Decline'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Accept & Save'),
          ),
        ],
      ),
    );
  }

  void _showTestBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Transfer Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                IconsaxPlusLinear.document_copy,
                color: AppColors.primary,
              ),
              title: const Text('Share Clipboard Text'),
              subtitle: const Text('Send copied link or text instantly'),
              onTap: () => Navigator.pop(ctx),
            ),
            ListTile(
              leading: const Icon(
                IconsaxPlusLinear.scan_barcode,
                color: AppColors.secondary,
              ),
              title: const Text('Generate QR Code'),
              subtitle: const Text('Allow nearby mobile camera scan'),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }
}
