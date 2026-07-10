class AppValidators {
  AppValidators._();

  static String? validateRequired(
      String? value, {
        String fieldName = 'Field',
      }) {
    final String input = value?.trim() ?? '';

    if (input.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final String email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Please enter email';
    }

    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Please enter valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final String password = value?.trim() ?? '';

    if (password.isEmpty) {
      return 'Please enter password';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? value,
      String password,
      ) {
    final String confirmPassword = value?.trim() ?? '';

    if (confirmPassword.isEmpty) {
      return 'Please confirm password';
    }

    if (confirmPassword != password.trim()) {
      return 'Password does not match';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    final String phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Please enter phone number';
    }

    if (phone.length < 10) {
      return 'Please enter valid phone number';
    }

    return null;
  }
}