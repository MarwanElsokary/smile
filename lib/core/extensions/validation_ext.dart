// import 'package:flutter/material.dart';
// import 'package:smile/core/extensions/project_extensions.dart';
// import '../input_formatter/app_regex.dart' show AppRegex;
//
// extension StringValidation on String? {
//   //Non_empty validator
//   String? validateNonEmpty(BuildContext context) {
//     if (this == null || this!.isEmpty) {
//       return "please Enter Your Email";
//     }
//     return null;
//   }
//
//   //Non_empty validator for custom parameter
//   String? validateEmpty(String customMessage) {
//     if (this == null || this!.isEmpty) {
//       return customMessage;
//     }
//     return null;
//   }
//
//   //first-last name validator
//   String? validateName(BuildContext context) {
//     if (this == null || this!.isEmpty) {
//       return context.l10n.pleaseEnterName;
//     }
//     if (!AppRegex.hasNameLength(this!)) {
//       return context.l10n.nameMustBeMoreThan3Characters;
//     }
//     return null;
//   }
//
//   //Password validator
//   String? validatePassword(BuildContext context) {
//     if (this == null || this!.isEmpty) {
//       return context.l10n.pleaseEnterYourPassword;
//     }
//     if (!AppRegex.isPasswordValid(this!)) {
//       return context.l10n.passwordMustContainUpperLowerAndSpecialCharacter;
//     }
//     return null;
//   }
//
//   //Confirm password validator
//   String? validateConfirmPassword(
//     TextEditingController passwordController,
//     BuildContext context,
//   ) {
//     if (this == null || this!.isEmpty) {
//       return context.l10n.pleaseEnterYourPassword;
//     }
//     if (this != passwordController.text) {
//       return context.l10n.passwordsDoNotMatch;
//     }
//     return null;
//   }
//
//   //Email validation
//   String? validateEmail(BuildContext context) {
//     if (this == null || this!.isEmpty) {
//       return context.l10n.passwordMustContainUpperLowerAndSpecialCharacter;
//     }
//     if (!AppRegex.isEmailValid(this!)) {
//       return context.l10n.emailMustBeLikeThisExampleGmailCom;
//     }
//     return null;
//   }
//
//   //Phone validation
//   String? validatePhoneNumber(BuildContext context) {
//     if (this == null || this!.isEmpty) {
//       return context.l10n.pleaseEnterYourPhoneNumber;
//     }
//     if (!AppRegex.isPhoneNumberValid(this!)) {
//       return context.l10n.enterAValidEgyptianPhoneNumber;
//     }
//
//     return null;
//   }
// }
