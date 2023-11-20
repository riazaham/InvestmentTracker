import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';

class SymbolSearchBar extends StatelessWidget {
  const SymbolSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return TextField(
          onSubmitted: (keywords) {
            //context.read<DashboardCubit>().testYahoo(keywords);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Search for symbol...',
            prefixIcon: const Icon(Icons.search_rounded),
          ),
        );
      },
    );
  }
}
