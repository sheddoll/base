import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class BaseAuthContainer extends StatelessWidget {
  const BaseAuthContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: Platform.isAndroid || Platform.isIOS ? 250 : 500,
      width: Platform.isAndroid || Platform.isIOS ? 300 : 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
        border: Border.all(color: Colors.black),
      ),
      child: child
    );
  }
}