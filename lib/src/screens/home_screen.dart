import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance/src/bloc/bloc.dart';
import 'package:finance/src/bloc/event.dart';
import 'package:finance/src/bloc/state.dart';
import 'package:finance/src/helper/helper.dart';
import 'package:finance/src/screens/widgets/loading_widget.dart';
import 'package:finance/src/screens/widgets/month_dropdown.dart';
import 'package:finance/src/screens/widgets/pie_chart.dart';
import 'package:finance/src/screens/widgets/transaction_tile.dart';
import 'package:finance/src/service/ui_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransactionBloc>(context).add(GetTransactions());
  }

  int monthFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .98),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<TransactionBloc, TransactionState>(
            listener: (context, state) {
          if (state is TransactionError) {
            UiService.handleUIError(context, error: state.error);
          }
        }, builder: (context, state) {
          if (state is TransactionLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'History',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
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
                              Helper.calculateTotalAmount(
                                      Helper.filterTransactionsByMonth(
                                          state.transactions, monthFilter))
                                  .toString(),
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
                    MonthDropdown(
                      onSelected: (value) => setState(() {
                        monthFilter = value;
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TransactionPieChart(transactions: state.transactions),
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: Helper.filterTransactionsByMonth(
                                    state.transactions, monthFilter)
                                .map((transaction) =>
                                    TransactionTile(transaction: transaction))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }
          return LoadingWidget();
        }),
      ),
    );
  }
}
