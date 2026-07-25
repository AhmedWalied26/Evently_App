class AppValidation {
  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }

    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }

    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value.trim())) {
      return 'Username can only contain letters';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }

    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Password must contain a number';
    }

    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
      return 'Password must contain a special character';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateEventTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Event title is required';
    }

    if (value.trim().length < 3) {
      return 'Event title must be at least 3 characters';
    }

    if (value.trim().length > 50) {
      return 'Event title must be less than 50 characters';
    }

    return null;
  }

  static String? validateEventDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Event description is required';
    }

    if (value.trim().length < 10) {
      return 'Description must be at least 10 characters';
    }

    if (value.trim().length > 500) {
      return 'Description must be less than 500 characters';
    }

    return null;
  }
}
