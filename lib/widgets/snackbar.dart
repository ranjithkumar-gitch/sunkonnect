import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';

showToast(String error) {
  BotToast.showText(
      text: error,
      contentColor: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      align: const Alignment(0, 0.1),
      backButtonBehavior: BackButtonBehavior.none,
      backgroundColor: Colors.transparent,
      textStyle: const TextStyle(fontSize: 18, color: Colors.black));
}
