import 'package:shared_preferences/shared_preferences.dart';

class SaveUserId {

static late SharedPreferences prefs;

  static Future cacheInitialization()async{
    prefs = await SharedPreferences.getInstance();
  }
  Future<void> setUserId( {required int userId})async{
    
      await prefs.setInt('userId', userId);
 }  
    int getUserId(){
     var userId = prefs.getInt('userId');
     return userId ?? 0;
  } 
}