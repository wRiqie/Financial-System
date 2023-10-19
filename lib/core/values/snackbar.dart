import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

abstract class _BaseSnackbar {
  Flushbar? _currentBar;

  _BaseSnackbar(BuildContext context,
      {String? title,
      required String message,
      Widget? icon,
      required Color backgroundColor,
      Color? textColor}) {
    _closeCurrent();
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      maxWidth: MediaQuery.of(context).size.width * .3,
      margin: const EdgeInsets.all(8),
      title: title,
      message: message,
      icon: icon,
      backgroundColor: backgroundColor,
      titleColor: textColor,
      messageColor: textColor,
      borderRadius: BorderRadius.circular(4),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  void _closeCurrent() {
    _currentBar?.dismiss();
  }
}

class SuccessSnackbar extends _BaseSnackbar {
  SuccessSnackbar(
    BuildContext context, {
    required String message,
    String? title,
    Widget? icon,
  }) : super(
          context,
          title: title,
          message: message,
          backgroundColor: const Color.fromARGB(255, 49, 116, 51),
          textColor: Colors.white,
          icon: icon,
        );
}

class AlertSnackbar extends _BaseSnackbar {
  AlertSnackbar(
    BuildContext context, {
    required String message,
    String? title,
    Widget? icon,
  }) : super(
          context,
          title: title,
          message: message,
          backgroundColor: const Color.fromARGB(255, 221, 134, 4),
          textColor: Colors.white,
          icon: icon,
        );
}

class ErrorSnackbar extends _BaseSnackbar {
  ErrorSnackbar(
    BuildContext context, {
    String? message,
    String? title,
    Widget? icon,
  }) : super(
          context,
          title: title,
          message: message ?? 'Ocorreu um erro, tente novamente...',
          backgroundColor: const Color(0xFFF64343),
          textColor: const Color(0xFFFCFCFC),
          icon: icon,
        );
}
