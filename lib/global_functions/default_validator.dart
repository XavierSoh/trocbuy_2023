class DefaultValidator {
  static String? validator(String? value) {
    if (value!.isEmpty) {
      return "*";
    }
    return null;
  }
}
