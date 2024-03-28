import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/locator.dart';
import 'package:flutter_sirius_map/src/app/presentation/widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyLocator.init();
  runApp(const ProviderScope(child: MyApp()));
}
