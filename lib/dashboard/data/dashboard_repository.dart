import 'dart:convert';

import 'package:investment_tracker/dashboard/data/dashboard_data_provider.dart';
import 'package:http/http.dart' as http;
import 'package:investment_tracker/dashboard/data/dashboard_model.dart';

class DashboardRepository {
  DashboardDataProvider dashboardDataProvider = DashboardDataProvider();

  // searchSymbols(String keywords) async {
  //   http.Response response = await dashboardDataProvider.searchSymbolsApi(keywords);
  //
  //   if (response.statusCode == 200) {
  //     return SymbolList.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('ERROR: error retrieving symbols: $response');
  //   }
  // }

  getTickerData(String ticker) async {
    Map<String, dynamic> response = await dashboardDataProvider.getTickerDataApi(ticker);
    if (response.isNotEmpty) {
      return SymbolChartData.fromJson(response);
    } else {
      throw Exception('ERROR: error retrieving chart data: $response');
    }
  }
}
