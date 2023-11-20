import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_tracker/dashboard/bloc/dashboard_cubit.dart';
import 'package:investment_tracker/dashboard/data/dashboard_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartView extends StatelessWidget {
  const LineChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if ((state as DashboardInitial).isLoadingChartData) {
          return const Center(child: CircularProgressIndicator());
        }
        SymbolChartData symbolChartData = state.symbolChartData!;
        List<ChartData> dataSource = [];
        for (int i = 0; i < symbolChartData.timestampList.length; i++) {
          int timestamp = symbolChartData.timestampList[i];
          DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
          double closeValue = symbolChartData.indicators.quote.close[i];
          dataSource.add(ChartData(dateTime, closeValue));
        }
        return SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipSettings: const InteractiveTooltip(
              enable: true,
              color: Colors.black54,
            ),
          ),
          series: <ChartSeries>[
            LineSeries<ChartData, DateTime>(
              dataSource: dataSource,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
          ],
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double? y;
}
