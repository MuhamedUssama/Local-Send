// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LocalSend UI Showcase';

  @override
  String get switchToLightMode => 'Switch to Light Mode';

  @override
  String get switchToDarkMode => 'Switch to Dark Mode';

  @override
  String get mdnsActive => 'mDNS Active';

  @override
  String get heroTitle => 'LocalSend Futuristic Theme';

  @override
  String get heroSubtitle =>
      'High-speed chunked streaming • Plus Jakarta Sans Typography';

  @override
  String get typographyHeader => 'Typography (Google Fonts)';

  @override
  String get displayMediumSample => 'Display Medium';

  @override
  String get headlineLargeSample => 'Headline Large';

  @override
  String get titleLargeSample => 'Title Large (File Name.pdf)';

  @override
  String get bodyLargeSample =>
      'Body Large - Seamless transfer across local devices.';

  @override
  String get bodyMediumSample => 'Body Medium - 124 MB of 500 MB (45.2 MB/s)';

  @override
  String get bodySmallSample => 'Body Small - 192.168.1.105:53317';

  @override
  String get buttonsHeader => 'Buttons & Actions';

  @override
  String get sendFiles => 'Send Files';

  @override
  String get receive => 'Receive';

  @override
  String get scanDevices => 'Scan Devices';

  @override
  String get viewHistory => 'View History';

  @override
  String get devicesHeader => 'Device Tiles & Status Badges';

  @override
  String get macbookName => 'Mohamed’s MacBook Pro';

  @override
  String get macbookSubtitle => 'macOS • 192.168.1.42';

  @override
  String get statusReady => 'Ready';

  @override
  String get iphoneName => 'iPhone 15 Pro Max';

  @override
  String get iphoneSubtitle => 'iOS • 192.168.1.88';

  @override
  String get statusSending => 'Sending 82%';

  @override
  String get streamingHeader => 'Real-Time Streaming & Speed';

  @override
  String get chunkedProgressTitle => 'Chunked Streaming Progress';

  @override
  String get progressSample => '78.4 MB / 100 MB';

  @override
  String get transferSpeedLabel => 'Transfer Speed: ';

  @override
  String get speedSample => '54.2 MB/s';

  @override
  String get controlsHeader => 'Inputs & Interactive Controls';

  @override
  String get fileRenameLabel => 'File Rename / Save Path';

  @override
  String get fileRenameHint => 'Enter file name';

  @override
  String get autoAcceptTitle => 'Auto-Accept Transfer Requests';

  @override
  String get autoAcceptSubtitle => 'Allow known devices to send without prompt';

  @override
  String get quickQrTitle => 'Quick QR Code Mode';

  @override
  String get quickQrSubtitle => 'Display QR code on discovery start';

  @override
  String bandwidthLimitTitle(String rate) {
    return 'Bandwidth Limit Rate ($rate MB/s)';
  }

  @override
  String get chipsHeader => 'Tags & Category Chips';

  @override
  String get archiveChip => 'Archive (.zip)';

  @override
  String get photosChip => 'Photos (42)';

  @override
  String get videoChip => 'Video (1.4 GB)';

  @override
  String get addCategoryChip => '+ Add Category';

  @override
  String get modalsHeader => 'Dialogs & Bottom Sheets';

  @override
  String get openDialog => 'Open Dialog';

  @override
  String get bottomSheet => 'Bottom Sheet';

  @override
  String get testSnackbar => 'Test SnackBar';

  @override
  String get snackBarSuccess => 'LocalSend theme verified successfully! 🚀';

  @override
  String get navSend => 'Send';

  @override
  String get navReceive => 'Receive';

  @override
  String get navHistory => 'History';

  @override
  String get navSettings => 'Settings';

  @override
  String get incomingConnectionTitle => 'Incoming Connection';

  @override
  String get incomingConnectionContent =>
      'MacBook Pro wants to send \"presentation_final.pdf\" (24.5 MB). Do you accept this transfer?';

  @override
  String get decline => 'Decline';

  @override
  String get acceptAndSave => 'Accept & Save';

  @override
  String get quickTransferOptionsTitle => 'Quick Transfer Options';

  @override
  String get shareClipboardTitle => 'Share Clipboard Text';

  @override
  String get shareClipboardSubtitle => 'Send copied link or text instantly';

  @override
  String get generateQrTitle => 'Generate QR Code';

  @override
  String get generateQrSubtitle => 'Allow nearby mobile camera scan';
}
