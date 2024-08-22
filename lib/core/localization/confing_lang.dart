import 'dart:convert';
import 'package:flutter/services.dart';
// Get the json file for each language
abstract class ConfingLang {
  static String currentLanguage = 'en';
  static Map localizations = {};
  static Future<void> loadlanguage(String lang) async {
    currentLanguage = lang;
    
    String translation;

    if (lang == 'ar') {
      translation = await rootBundle.loadString("assets/locale/ar.json");
    } else {
      translation = await rootBundle.loadString("assets/locale/en.json");
    }

    if (translation.isNotEmpty) {
      localizations = jsonDecode(translation);
    } else {
      throw const FormatException("The file is empty or not found");
    }
  }
}