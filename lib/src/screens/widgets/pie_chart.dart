import 'package:finance/src/helper/helper.dart';
import 'package:finance/src/models/transaction_response.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionPieChart extends StatefulWidget {
  const TransactionPieChart({super.key, required this.transactions});
  final List<TransactionResponse> transactions;
  @override
  State<TransactionPieChart> createState() => _TransactionPieChartState();
}

class _TransactionPieChartState extends State<TransactionPieChart> {
  List<Color> chartColors = [
    Color(0xFF9b83d3),
    Color(0xFF83d1d3),
    Color(0xFFf0d8f2),
    Color(0xFFf2e1d8),
    Color(0xFF83d39d),
    Color(0xFF83a7d3),
  ];

  List<PieChartSectionData> getPieSections(
      List<TransactionResponse> transactions) {
    final total = transactions.fold(0.0, (sum, tx) => sum + (tx.amount ?? 0));

    return transactions.asMap().entries.map((entry) {
      final index = entry.key;
      final tx = entry.value;
      final percentage = ((tx.amount ?? 0) / total) * 100;

      return PieChartSectionData(
        value: (tx.amount ?? 0).toDouble(),
        title: '${percentage.toStringAsFixed(1)}%',
        color: chartColors[index % chartColors.length],
        radius: 40,
        titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
        showTitle: false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: getPieSections(widget.transactions),
              centerSpaceRadius: 70,
              sectionsSpace: 2,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Helper.calculateTotalAmount(widget.transactions).toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' \$',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFf29995)),
                  )
                ],
              ),
              Text('Netflix Expenses',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
