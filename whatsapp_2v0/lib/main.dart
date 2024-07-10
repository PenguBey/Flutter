import 'package:flutter/material.dart';
import 'package:whatsapp_2v0/color.dart';
import 'package:whatsapp_2v0/responsive/responsive_layout.dart';
import 'package:whatsapp_2v0/view/desktoplayout.dart';
import 'package:whatsapp_2v0/view/mobilelayout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FloatCount())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WhatsApp',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: const ResponsiveLayout(
            desktopView: DesktopLayout(), mobileView: Mobilelayout()),
      ),
    );
  }
}


