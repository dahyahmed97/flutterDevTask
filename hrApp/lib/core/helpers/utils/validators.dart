class Validators {
  static String? isTextFilled(String? val, String errMsg) {
    if (val == null || val.isEmpty) {
      return errMsg;
    }
    return null;
  }

  static bool isDate(String dateString) {
    try {
      DateTime.parse(dateString);
      return true;
    } catch (e) {
      return false;
    }
  }
}
