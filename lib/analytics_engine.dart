import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'firebase_options.dart';

class AnalyticsEngine {
  static final instance = FirebaseAnalytics.instance;

  static Future<void> init() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  // static void translateButtonClickedEqToWords() {
  //   _instance.logEvent(name: "translate_button_clicked_eq_to_words");
  // }

  static void logTranslateButtonClick(String language) async {
    print('language: $language');
    await instance.logEvent(
      name: 'eq_to_words_translate',
      parameters: <String, Object>{
        'language': language,
      },
    );
  }
}
