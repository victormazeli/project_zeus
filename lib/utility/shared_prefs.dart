import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _prefs;
  init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  String get token => _prefs.getString(keytoken) ?? "";
  String get domainurl => _prefs.getString(keydomaiurl) ?? "";
  int get userid => _prefs.getInt(keyuserid) ?? 0;
  int get storeid => _prefs.getInt(keystoreid) ?? 0;

  set token(String value) {
    _prefs.setString(keytoken, value);
  }

    set domainurl(String value) {
    _prefs.setString(keydomaiurl, value);
  }


  set userid(int value) {
    _prefs.setInt(keytoken, value);
  }

  set storeid(int value) {
    _prefs.setInt(keytoken, value);
  }

  void deltoken() {
    _prefs.remove("token");
  }

  void delurl() {
    _prefs.remove("domain_url");
  }

    void deluserid() {
    _prefs.remove("user_id");
  }

    void delstoreid() {
    _prefs.remove("store_id");
  }
}

final sharedPrefs = SharedPrefs();
const String keytoken = "token";
const String keyuserid = "user_id";
const String keystoreid = "store_id";
const String keydomaiurl = "domain_url";
