class Validators {
  static String? noneEmptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? userNameValidator(String? value) {
    Pattern mobileNumberPattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (RegExp(emailPattern as String).hasMatch(value!)) {
      return null;
    } else if (RegExp(mobileNumberPattern as String).hasMatch(value)) {
      return null;
    } else {
      return "Please enter a valid username";
    }
  }

  static String? passwordValidator(String? value) {
    return value!.length > 4 ? null : "Try one with minimum 5 characters";
  }

  static String? confirmPasswordValidator(String value, password) {
    return password == value ? null : "Please enter the same password";
  }

  static String? pincodeValidator(String? value) {
    String pattern = r'^[1-9][0-9]{5}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value!) ? null : "Please enter a valid Pincode";
  }

  static String? mobileNumberValidator(value) {
    if (value?.length != 10) {
      return "Enter a valid number";
    } else {
      return null;
    }
  }

  static String? emailValidator(String? email) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern as String).hasMatch(email!)
        ? null
        : "Please use a valid email address";
  }

  static bool isValidEmail(String email) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern as String).hasMatch(email);
  }

  static bool isValidMobile(String mobile) {
    dynamic mobileNumberPattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    return RegExp(mobileNumberPattern).hasMatch(mobile);
  }
}
