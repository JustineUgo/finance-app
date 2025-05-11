import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance/src/helper/helper.dart';
import 'package:finance/src/models/transaction_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.transaction});
  final TransactionResponse transaction;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Color(0xFFF7F7F7),
              ),
              child: Icon(
                CupertinoIcons.chevron_back,
                color: Color(0xFF676767),
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text(
          'Transaction Details',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0,
            height: 1.5,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
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
            const SizedBox(height: 12),
            Text(
              widget.transaction.name ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0,
                height: 1.5,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green.shade100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Successful',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TransactionEntry(
                    text: 'Date',
                    value:
                        Helper.formatTransactionDate(widget.transaction.time),
                  ),
                  SizedBox(height: 32),
                  TransactionEntry(
                    text: 'Status',
                    value: 'Success',
                  ),
                  SizedBox(height: 32),
                  TransactionEntry(
                    text: 'Amount',
                    value: '\$${widget.transaction.amount ?? 0}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionEntry extends StatelessWidget {
  const TransactionEntry({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
