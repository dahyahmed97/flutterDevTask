import 'package:flutterdevtask/core/helpers/constants/app_constants.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_util.dart';

class PrefManager {
  PrefUtils prefUtils = PrefUtils();

  Future<void> setAccessToken(String data) async {
    await prefUtils.saveData<String>(Keys.token, data);
  }

  Future<String?> getAccessToken() async {
    return await prefUtils.getData<String>(Keys.token);
  }

  Future<void> setKeyValue(String key, dynamic value) async {
    await prefUtils.saveData<dynamic>(key, value);
  }

  Future<dynamic> getValueByKey(String key) async {
    return await prefUtils.getData<dynamic>(key);
  }
}
