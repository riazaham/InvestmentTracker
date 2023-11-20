import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:investment_tracker/dashboard/data/dashboard_model.dart';
import 'package:investment_tracker/dashboard/data/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(const DashboardInitial(
          symbolList: null,
          selectedSymbolIndex: 0,
          isLoadingSymbolsList: true,
          isLoadingChartData: true,
          symbolChartData: null,
        )) {
    generateSymbolDetails();
  }

  DashboardRepository dashboardRepository = DashboardRepository();

  generateSymbolDetails() async {
    SymbolList hardcodedSymbolList = SymbolList(symbolDetails: [
      SymbolDetail(id: 'GOOG', name: 'Alphabet Inc.'),
      SymbolDetail(id: 'AAPL', name: 'Apple Inc.'),
      SymbolDetail(id: 'TSLA', name: 'Telsa, Inc.'),
    ]);
    SymbolChartData symbolChartData = await dashboardRepository.getTickerData('GOOG');
    emit(DashboardInitial(
      symbolList: hardcodedSymbolList,
      isLoadingSymbolsList: false,
      isLoadingChartData: false,
      selectedSymbolIndex: 0,
      symbolChartData: symbolChartData,
    ));
  }

  // setDashboardInitialState(String keywords) async {
  //   emit(DashboardInitial(
  //     symbolList: SymbolList(symbolDetails: []),
  //     isLoading: true,
  //   ));
  //   SymbolList symbolList = await dashboardRepository.searchSymbols(keywords);
  //   emit(DashboardInitial(
  //     symbolList: symbolList,
  //     isLoading: false,
  //   ));
  // }

  getTickerData(int selectedSymbolIndex) async {
    DashboardInitial currState = (state as DashboardInitial);

    emit(DashboardInitial(
      symbolList: currState.symbolList,
      isLoadingSymbolsList: false,
      isLoadingChartData: true,
      selectedSymbolIndex: selectedSymbolIndex,
      symbolChartData: currState.symbolChartData,
    ));

    String selectedSymbolId = currState.symbolList!.symbolDetails[selectedSymbolIndex].id;
    SymbolChartData symbolChartData = await dashboardRepository.getTickerData(selectedSymbolId);

    emit(DashboardInitial(
      symbolList: currState.symbolList,
      isLoadingSymbolsList: false,
      isLoadingChartData: false,
      selectedSymbolIndex: selectedSymbolIndex,
      symbolChartData: symbolChartData,
    ));
  }
}
