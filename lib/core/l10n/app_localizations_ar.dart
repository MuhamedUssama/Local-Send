// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'استعراض واجهة LocalSend';

  @override
  String get switchToLightMode => 'التبديل إلى النمط الفاتح';

  @override
  String get switchToDarkMode => 'التبديل إلى النمط الداكن';

  @override
  String get mdnsActive => 'mDNS نشط';

  @override
  String get heroTitle => 'ثيم LocalSend المستقبلي';

  @override
  String get heroSubtitle => 'بث مقسّم عالي السرعة • خط Plus Jakarta Sans';

  @override
  String get typographyHeader => 'الخطوط والنصوص (Google Fonts)';

  @override
  String get displayMediumSample => 'عنوان كبير جداً (Display Medium)';

  @override
  String get headlineLargeSample => 'عنوان رئيسي (Headline Large)';

  @override
  String get titleLargeSample => 'عنوان مقطع (اسم الملف.pdf)';

  @override
  String get bodyLargeSample => 'نص عادي كبير - نقل سلس عبر الأجهزة المحلية.';

  @override
  String get bodyMediumSample =>
      'نص عادي متوسط - 124 ميجابايت من 500 ميجابايت (45.2 م.ب/ث)';

  @override
  String get bodySmallSample => 'نص عادي صغير - 192.168.1.105:53317';

  @override
  String get buttonsHeader => 'الأزرار والإجراءات';

  @override
  String get sendFiles => 'إرسال ملفات';

  @override
  String get receive => 'استلام';

  @override
  String get scanDevices => 'فحص الأجهزة';

  @override
  String get viewHistory => 'عرض السجل';

  @override
  String get devicesHeader => 'قائمة الأجهزة وحالات الاتصال';

  @override
  String get macbookName => 'ماك بوك برو الخاص بمحمد';

  @override
  String get macbookSubtitle => 'ماك أو إس • 192.168.1.42';

  @override
  String get statusReady => 'جاهز';

  @override
  String get iphoneName => 'آيفون 15 برو ماكس';

  @override
  String get iphoneSubtitle => 'آي أو إس • 192.168.1.88';

  @override
  String get statusSending => 'جاري الإرسال 82%';

  @override
  String get streamingHeader => 'البث والسرعة المباشرة';

  @override
  String get chunkedProgressTitle => 'تقدم البث المقسّم';

  @override
  String get progressSample => '78.4 ميجابايت / 100 ميجابايت';

  @override
  String get transferSpeedLabel => 'سرعة النقل: ';

  @override
  String get speedSample => '54.2 م.ب/ث';

  @override
  String get controlsHeader => 'حقول الإدخال وعناصر التحكم';

  @override
  String get fileRenameLabel => 'تغيير اسم الملف / مسار الحفظ';

  @override
  String get fileRenameHint => 'أدخل اسم الملف';

  @override
  String get autoAcceptTitle => 'قبول طلبات النقل تلقائياً';

  @override
  String get autoAcceptSubtitle =>
      'السماح للأجهزة المعروفة بالإرسال دون مطالبة';

  @override
  String get quickQrTitle => 'وضع رمز QR السريع';

  @override
  String get quickQrSubtitle => 'عرض رمز QR عند بدء البحث';

  @override
  String bandwidthLimitTitle(String rate) {
    return 'حد سرعة النقل ($rate م.ب/ث)';
  }

  @override
  String get chipsHeader => 'وسومات وفئات الملفات';

  @override
  String get archiveChip => 'أرشيف (.zip)';

  @override
  String get photosChip => 'صور (42)';

  @override
  String get videoChip => 'فيديو (1.4 ج.ب)';

  @override
  String get addCategoryChip => '+ إضافة فئة';

  @override
  String get modalsHeader => 'النوافذ المنبثقة والخيارات';

  @override
  String get openDialog => 'فتح نافذة';

  @override
  String get bottomSheet => 'القائمة السفلى';

  @override
  String get testSnackbar => 'اختبار شريط التنبيه';

  @override
  String get snackBarSuccess => 'تم التحقق من ثيم LocalSend بنجاح! 🚀';

  @override
  String get navSend => 'إرسال';

  @override
  String get navReceive => 'استلام';

  @override
  String get navHistory => 'السجل';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get incomingConnectionTitle => 'اتصال وارد';

  @override
  String get incomingConnectionContent =>
      'يرغب MacBook Pro في إرسال \"presentation_final.pdf\" (24.5 ميجابايت). هل تقبل هذا النقل؟';

  @override
  String get decline => 'رفض';

  @override
  String get acceptAndSave => 'قبول وحفظ';

  @override
  String get quickTransferOptionsTitle => 'خيارات النقل السريع';

  @override
  String get shareClipboardTitle => 'مشاركة نص الحافظة';

  @override
  String get shareClipboardSubtitle => 'إرسال الرابط أو النص المنسوخ فورياً';

  @override
  String get generateQrTitle => 'إنشاء رمز QR';

  @override
  String get generateQrSubtitle => 'السماح بالمسح عبر كاميرا الهاتف القريب';

  @override
  String get personalizeTitle => 'خصص تجربتك';

  @override
  String get personalizeSubtitle =>
      'اختر المظهر واللغة المفضلين لديك للبدء بتجربة مريحة ومخصصة تناسب أسلوبك.';

  @override
  String get letsStart => 'هيا نبدأ';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get languageArabic => 'العربية';

  @override
  String get themeLabel => 'المظهر';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get onBoardingFastLocalBadge => 'سريع ومحلي';

  @override
  String get onBoardingFastLocalTitle => 'مشاركة ملفات محلية فورية';

  @override
  String get onBoardingFastLocalDesc =>
      'شارك الصور والفيديوهات والمستندات مباشرة مع الأجهزة على شبكتك المحلية بأقصى سرعة.';

  @override
  String get onBoardingEncryptedBadge => 'مشفر وخاص';

  @override
  String get onBoardingEncryptedTitle => 'أمان مباشر وشامل';

  @override
  String get onBoardingEncryptedDesc =>
      'تبقى ملفاتك خاصة تماماً. يتم تشفير عمليات النقل وإرسالها مباشرة دون المرور بأي خوادم سحابية.';

  @override
  String get onBoardingCrossPlatformBadge => 'متعدد المنصات';

  @override
  String get onBoardingCrossPlatformTitle => 'دعم شامل لجميع الأجهزة';

  @override
  String get onBoardingCrossPlatformDesc =>
      'تواصل وشارك بسهولة عبر آندرويد، آيفون، ويندوز، ماك، ولينكس دون أي قيود.';
}
