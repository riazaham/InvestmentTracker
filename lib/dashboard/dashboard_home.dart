import 'package:flutter/material.dart';
import 'package:investment_tracker/dashboard/presentation/dashboard_body.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Tracker'),
      ),
      body: const DashboardBody(),
    );
  }
}
