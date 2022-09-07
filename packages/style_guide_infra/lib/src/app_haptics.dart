import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppHaptics {
  static bool debugSound = kDebugMode;
  static bool debugLog = kDebugMode;

  static void buttonPress() {
    if (defaultTargetPlatform != TargetPlatform.android || defaultTargetPlatform != TargetPlatform.fuchsia) {
      lightImpact();
    }
  }

  static Future<void> lightImpact() {
    _debug('lightImpact');
    return HapticFeedback.lightImpact();
  }

  static Future<void> mediumImpact() {
    _debug('mediumImpact');
    return HapticFeedback.mediumImpact();
  }

  static Future<void> heavyImpact() {
    _debug('heavyImpact');
    return HapticFeedback.heavyImpact();
  }

  static Future<void> selectionClick() {
    _debug('selectionClick');
    return HapticFeedback.selectionClick();
  }

  static Future<void> vibrate() {
    _debug('vibrate');
    return HapticFeedback.vibrate();
  }

  static void _debug(String label) {
    if (debugLog) debugPrint('Haptic.$label');
    if (debugSound) {
      SystemSound.play(SystemSoundType.alert); // only plays on desktop
      SystemSound.play(SystemSoundType.click); // only plays on mobile
    }
  }
}
