import 'package:e_cinemav1/authentification/view/register_view.dart';
import 'package:e_cinemav1/consts/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'authentification/services/authstate_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStateProvider()),
      ],
      child: GetMaterialApp(theme: regularTheme, home: RegisterUI()),
    );
  }
}
