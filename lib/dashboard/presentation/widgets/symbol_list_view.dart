import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';
import 'package:investment_tracker/dashboard/data/dashboard_model.dart';
import 'package:investment_tracker/dashboard/presentation/widgets/symbol_list_view_item.dart';

class SymbolListView extends StatelessWidget {
  const SymbolListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        bool isLoading = (state as DashboardInitial).isLoadingSymbolsList;

        return isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<SymbolDetail> symbolDetails = state.symbolList!.symbolDetails;
                  return GestureDetector(
                    onTap: () => context.read<DashboardCubit>().getTickerData(index),
                    child: SymbolListViewItem(
                      symbolDetail: symbolDetails[index],
                      isSelected: state.selectedSymbolIndex == index,
                    ),
                  );
                });
      },
    );
  }
}
