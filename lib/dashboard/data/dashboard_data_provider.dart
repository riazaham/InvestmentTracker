import 'package:http/http.dart' as http;
import 'package:investment_tracker/api_helper.dart';
import 'package:yahoo_finance_data_reader/yahoo_finance_data_reader.dart';

class DashboardDataProvider {
  // searchSymbolsApi(String keywords) async {
  //   final queryParameters = {
  //     'function': 'SYMBOL_SEARCH',
  //     'keywords': keywords,
  //     'apikey': ApiHelper.apikey,
  //   };
  //   Uri uri = Uri.https(ApiHelper.baseUrl, ApiHelper.baseQuery, queryParameters);
  //
  //   return await http.get(uri);
  // }

  getTickerDataApi(String ticker) async {
    Map<String, dynamic> response = await const YahooFinanceDailyReader().getDailyData(ticker);
    return response;
  }
}
