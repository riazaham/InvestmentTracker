import 'package:flutter/material.dart';
import 'package:investment_tracker/dashboard/presentation/widgets/line_chart_view.dart';
import 'package:investment_tracker/dashboard/presentation/widgets/symbol_list_view.dart';
import 'package:investment_tracker/dashboard/presentation/widgets/symbol_search_bar.dart';
import 'package:investment_tracker/dashboard/presentation/widgets/symbol_search_count.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SymbolSearchBar(),
                // SizedBox(height: 3),
                // SymbolSearchCount(),
                Divider(),
                SizedBox(height: 10),
                SymbolListView(),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 8,
            child: Column(
              children: <Widget>[
                Expanded(child: LineChartView()),
              ],
            ))
      ],
    );
  }
}
