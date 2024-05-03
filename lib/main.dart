import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallary/screens/home.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      //tools: const [...DevicePreview.defaultTools],
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gallery Assignment Ostad ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
