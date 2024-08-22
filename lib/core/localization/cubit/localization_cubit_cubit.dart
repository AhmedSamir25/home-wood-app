import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'localization_cubit_state.dart';

class LocalizationCubitCubit extends Cubit<LocalizationState> {
  LocalizationCubitCubit() : super(LocalizationInitial());
  Future<void> loadInitialLanguage()async{
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    String lang =  pref.getString("lang") ?? "en";
    await ConfingLang.loadlanguage(lang);
    emit(LocalizationUpdate());
  } 
   void changeLang(String newLang) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('lang', newLang);
    await ConfingLang.loadlanguage(newLang);
    emit(LocalizationUpdate());
  }
}
