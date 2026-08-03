import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppValidation {
  static String? validateUserName(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.username_required;
    }

    if (value.trim().length < 3) {
      return AppLocalizations.of(context)!.username_min_length;
    }

    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value.trim())) {
      return AppLocalizations.of(context)!.username_letters_only;
    }

    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.email_required;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return AppLocalizations.of(context)!.email_invalid;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.password_required;
    }

    if (value.length < 8) {
      return AppLocalizations.of(context)!.password_min_length;
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return AppLocalizations.of(context)!.password_uppercase;
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return AppLocalizations.of(context)!.password_lowercase;
    }

    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return AppLocalizations.of(context)!.password_number;
    }

    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
      return AppLocalizations.of(context)!.password_special_character;
    }

    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.confirm_password_required;
    }

    if (value != password) {
      return AppLocalizations.of(context)!.passwords_do_not_match;
    }

    return null;
  }

  static String? validateEventTitle(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.event_title_required;
    }

    if (value.trim().length < 3) {
      return AppLocalizations.of(context)!.event_title_min_length;
    }

    if (value.trim().length > 50) {
      return AppLocalizations.of(context)!.event_title_max_length;
    }

    return null;
  }

  static String? validateEventDescription(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.event_description_required;
    }

    if (value.trim().length < 10) {
      return AppLocalizations.of(context)!.event_description_min_length;
    }

    if (value.trim().length > 500) {
      return AppLocalizations.of(context)!.event_description_max_length;
    }

    return null;
  }
}
