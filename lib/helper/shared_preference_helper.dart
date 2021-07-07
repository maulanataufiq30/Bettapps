import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userCredentialIdKey = "USERCREDENTIALKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageUrl = "USERIMAGEKEY";
  static String logedInKey = "LOGEDINKEY";

  //save data
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userIdKey, getUserId);
  }
  Future<bool> saveUserCredentialId(String getUserCredentialId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userCredentialIdKey, getUserCredentialId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUserEmail);
  }
  Future<bool> saveImageUrl(String getUserImageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userImageUrl, getUserImageUrl);
  }

  Future<bool> saveLogedIn(String getLogedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(logedInKey, getLogedIn);
  }

  //get data
  Future<String> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userIdKey);
  }
  Future<String> getUserCredentialId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userCredentialIdKey);
  }

  Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }
  
  Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }
  Future<String> getImageUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userImageUrl);
  }
  Future<String> getLogedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(logedInKey);
  }
}
