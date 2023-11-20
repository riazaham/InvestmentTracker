import 'package:flutter/material.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';
import 'package:investment_tracker/dashboard/dashboard_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardHome.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DashboardCubit>(
            create: (context) => DashboardCubit(),
            child: const DashboardHome(),
          ),
        );
      default:
        throw Exception('Error: Undefined route name ${settings.name}');
    }
  }
}
