import 'package:base/app.dart';
import 'package:base/injection_container.dart.dart';
import 'package:flutter/material.dart';




main() async {
  await initializeDependencies();
  runApp(const BaseApp());
}

