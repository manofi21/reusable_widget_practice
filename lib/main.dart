import 'package:form_tutorial/module/dashboard/view/dashboard_view.dart';
import 'package:form_tutorial/state_util.dart';
import 'package:flutter/material.dart';

// Remove all commnet by : Shift + Alt + /
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashboardView(),
    );
  }
}
