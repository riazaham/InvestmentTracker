part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  const DashboardInitial({
    required this.symbolList,
    required this.selectedSymbolIndex,
    required this.isLoadingChartData,
    required this.isLoadingSymbolsList,
    required this.symbolChartData,
  });

  final SymbolList? symbolList;
  final int selectedSymbolIndex;
  final bool isLoadingChartData;
  final bool isLoadingSymbolsList;
  final SymbolChartData? symbolChartData;

  @override
  List<Object?> get props => [symbolList, isLoadingChartData, isLoadingSymbolsList, symbolChartData, selectedSymbolIndex];
}
