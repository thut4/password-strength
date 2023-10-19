import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_strength/binding/home_binding.dart';
import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
