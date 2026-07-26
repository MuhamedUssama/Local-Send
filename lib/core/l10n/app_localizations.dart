import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'LocalSend UI Showcase'**
  String get appTitle;

  /// No description provided for @switchToLightMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Light Mode'**
  String get switchToLightMode;

  /// No description provided for @switchToDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Dark Mode'**
  String get switchToDarkMode;

  /// No description provided for @mdnsActive.
  ///
  /// In en, this message translates to:
  /// **'mDNS Active'**
  String get mdnsActive;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'LocalSend Futuristic Theme'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'High-speed chunked streaming • Plus Jakarta Sans Typography'**
  String get heroSubtitle;

  /// No description provided for @typographyHeader.
  ///
  /// In en, this message translates to:
  /// **'Typography (Google Fonts)'**
  String get typographyHeader;

  /// No description provided for @displayMediumSample.
  ///
  /// In en, this message translates to:
  /// **'Display Medium'**
  String get displayMediumSample;

  /// No description provided for @headlineLargeSample.
  ///
  /// In en, this message translates to:
  /// **'Headline Large'**
  String get headlineLargeSample;

  /// No description provided for @titleLargeSample.
  ///
  /// In en, this message translates to:
  /// **'Title Large (File Name.pdf)'**
  String get titleLargeSample;

  /// No description provided for @bodyLargeSample.
  ///
  /// In en, this message translates to:
  /// **'Body Large - Seamless transfer across local devices.'**
  String get bodyLargeSample;

  /// No description provided for @bodyMediumSample.
  ///
  /// In en, this message translates to:
  /// **'Body Medium - 124 MB of 500 MB (45.2 MB/s)'**
  String get bodyMediumSample;

  /// No description provided for @bodySmallSample.
  ///
  /// In en, this message translates to:
  /// **'Body Small - 192.168.1.105:53317'**
  String get bodySmallSample;

  /// No description provided for @buttonsHeader.
  ///
  /// In en, this message translates to:
  /// **'Buttons & Actions'**
  String get buttonsHeader;

  /// No description provided for @sendFiles.
  ///
  /// In en, this message translates to:
  /// **'Send Files'**
  String get sendFiles;

  /// No description provided for @receive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// No description provided for @scanDevices.
  ///
  /// In en, this message translates to:
  /// **'Scan Devices'**
  String get scanDevices;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @devicesHeader.
  ///
  /// In en, this message translates to:
  /// **'Device Tiles & Status Badges'**
  String get devicesHeader;

  /// No description provided for @macbookName.
  ///
  /// In en, this message translates to:
  /// **'Mohamed’s MacBook Pro'**
  String get macbookName;

  /// No description provided for @macbookSubtitle.
  ///
  /// In en, this message translates to:
  /// **'macOS • 192.168.1.42'**
  String get macbookSubtitle;

  /// No description provided for @statusReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get statusReady;

  /// No description provided for @iphoneName.
  ///
  /// In en, this message translates to:
  /// **'iPhone 15 Pro Max'**
  String get iphoneName;

  /// No description provided for @iphoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'iOS • 192.168.1.88'**
  String get iphoneSubtitle;

  /// No description provided for @statusSending.
  ///
  /// In en, this message translates to:
  /// **'Sending 82%'**
  String get statusSending;

  /// No description provided for @streamingHeader.
  ///
  /// In en, this message translates to:
  /// **'Real-Time Streaming & Speed'**
  String get streamingHeader;

  /// No description provided for @chunkedProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Chunked Streaming Progress'**
  String get chunkedProgressTitle;

  /// No description provided for @progressSample.
  ///
  /// In en, this message translates to:
  /// **'78.4 MB / 100 MB'**
  String get progressSample;

  /// No description provided for @transferSpeedLabel.
  ///
  /// In en, this message translates to:
  /// **'Transfer Speed: '**
  String get transferSpeedLabel;

  /// No description provided for @speedSample.
  ///
  /// In en, this message translates to:
  /// **'54.2 MB/s'**
  String get speedSample;

  /// No description provided for @controlsHeader.
  ///
  /// In en, this message translates to:
  /// **'Inputs & Interactive Controls'**
  String get controlsHeader;

  /// No description provided for @fileRenameLabel.
  ///
  /// In en, this message translates to:
  /// **'File Rename / Save Path'**
  String get fileRenameLabel;

  /// No description provided for @fileRenameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter file name'**
  String get fileRenameHint;

  /// No description provided for @autoAcceptTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-Accept Transfer Requests'**
  String get autoAcceptTitle;

  /// No description provided for @autoAcceptSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow known devices to send without prompt'**
  String get autoAcceptSubtitle;

  /// No description provided for @quickQrTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick QR Code Mode'**
  String get quickQrTitle;

  /// No description provided for @quickQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Display QR code on discovery start'**
  String get quickQrSubtitle;

  /// No description provided for @bandwidthLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Bandwidth Limit Rate ({rate} MB/s)'**
  String bandwidthLimitTitle(String rate);

  /// No description provided for @chipsHeader.
  ///
  /// In en, this message translates to:
  /// **'Tags & Category Chips'**
  String get chipsHeader;

  /// No description provided for @archiveChip.
  ///
  /// In en, this message translates to:
  /// **'Archive (.zip)'**
  String get archiveChip;

  /// No description provided for @photosChip.
  ///
  /// In en, this message translates to:
  /// **'Photos (42)'**
  String get photosChip;

  /// No description provided for @videoChip.
  ///
  /// In en, this message translates to:
  /// **'Video (1.4 GB)'**
  String get videoChip;

  /// No description provided for @addCategoryChip.
  ///
  /// In en, this message translates to:
  /// **'+ Add Category'**
  String get addCategoryChip;

  /// No description provided for @modalsHeader.
  ///
  /// In en, this message translates to:
  /// **'Dialogs & Bottom Sheets'**
  String get modalsHeader;

  /// No description provided for @openDialog.
  ///
  /// In en, this message translates to:
  /// **'Open Dialog'**
  String get openDialog;

  /// No description provided for @bottomSheet.
  ///
  /// In en, this message translates to:
  /// **'Bottom Sheet'**
  String get bottomSheet;

  /// No description provided for @testSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Test SnackBar'**
  String get testSnackbar;

  /// No description provided for @snackBarSuccess.
  ///
  /// In en, this message translates to:
  /// **'LocalSend theme verified successfully! 🚀'**
  String get snackBarSuccess;

  /// No description provided for @navSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get navSend;

  /// No description provided for @navReceive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get navReceive;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @incomingConnectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Incoming Connection'**
  String get incomingConnectionTitle;

  /// No description provided for @incomingConnectionContent.
  ///
  /// In en, this message translates to:
  /// **'MacBook Pro wants to send \"presentation_final.pdf\" (24.5 MB). Do you accept this transfer?'**
  String get incomingConnectionContent;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @acceptAndSave.
  ///
  /// In en, this message translates to:
  /// **'Accept & Save'**
  String get acceptAndSave;

  /// No description provided for @quickTransferOptionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Transfer Options'**
  String get quickTransferOptionsTitle;

  /// No description provided for @shareClipboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Clipboard Text'**
  String get shareClipboardTitle;

  /// No description provided for @shareClipboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send copied link or text instantly'**
  String get shareClipboardSubtitle;

  /// No description provided for @generateQrTitle.
  ///
  /// In en, this message translates to:
  /// **'Generate QR Code'**
  String get generateQrTitle;

  /// No description provided for @generateQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow nearby mobile camera scan'**
  String get generateQrSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
