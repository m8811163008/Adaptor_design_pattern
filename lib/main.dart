import 'package:adaptor_design_pattern/show%20contacts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Adaptor design pattern',
      home: HomePage(),
    );
  }
}
