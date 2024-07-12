class FieldValidation {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Enter Email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please Enter a valid Email Address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter Password';
    } else if (value.length < 8) {
      return 'Password must be 8 characters long';
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return 'Enter Name';
    }

    return null;
  }

  static String? validateMessage(String? value) {
    if (value!.isEmpty) {
      return 'Enter Message';
    }

    return null;
  }
}
