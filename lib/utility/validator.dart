
import 'string_res.dart';

class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return emptyEmailField;
    }
    // Regex for email validation
    final regExp = RegExp(emailRegex);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return invalidEmailField;
  }
}

class PhoneNumberValidator {
  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    if (value.length >= 10) {
      return null;
    }
    return invalidPhoneNumberField;
  }
}

class PasswordValidator {
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return emptyPasswordField;
    }
    if (value.length < 8) {
      return passwordLengthError;
    }
    final regExp = RegExp(passwordRegex);

    if (!regExp.hasMatch(value)) {
      return invalidPassword;
    }

    return null;
  }
}

class UsernameValidator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return emptyUsernameField;
    }

    if (value.length < 6) {
      return usernameLengthError;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}
