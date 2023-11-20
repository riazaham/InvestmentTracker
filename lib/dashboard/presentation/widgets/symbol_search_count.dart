import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';

class SymbolSearchCount extends StatelessWidget {
  const SymbolSearchCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        // int searchCount = (state as DashboardInitial).symbolList.symbolDetails.length;
        int searchCount = 0;
        return Text('Search results: $searchCount');
      },
    );
  }
}
