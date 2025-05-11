import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance/src/screens/widgets/transaction_tile.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .98),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text('Netflix',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(
              'Production Company',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total payment'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '897.90',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          ' \$',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFf29995)),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text('May',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 4),
                      Icon(CupertinoIcons.chevron_down, size: 12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: getPieSections(netflixTransactions),
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
                            '897.90',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Transaction',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        TransactionTile(),
                        TransactionTile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> chartColors = [
    Color(0xFF9b83d3),
    Color(0xFF83d1d3),
    Color(0xFFf0d8f2),
    Color(0xFFf2e1d8),
    Color(0xFF83d39d),
    Color(0xFF83a7d3),
  ];

  List<PieChartSectionData> getPieSections(List<Transaction> transactions) {
    final total = transactions.fold(0.0, (sum, tx) => sum + tx.amount);

    return transactions.asMap().entries.map((entry) {
      final index = entry.key;
      final tx = entry.value;
      final percentage = (tx.amount / total) * 100;

      return PieChartSectionData(
        value: tx.amount,
        title: '${percentage.toStringAsFixed(1)}%',
        color: chartColors[index % chartColors.length],
        radius: 40,
        titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
        showTitle: false,
      );
    }).toList();
  }

  final List<Transaction> netflixTransactions = [
    Transaction(id: 1, amount: 1500),
    Transaction(id: 2, amount: 500),
    Transaction(id: 3, amount: 1000),
    Transaction(id: 4, amount: 100),
    Transaction(id: 5, amount: 800),
    Transaction(id: 6, amount: 10),
  ];
}

class Transaction {
  final int id;
  final double amount;

  Transaction({required this.id, required this.amount});
}
