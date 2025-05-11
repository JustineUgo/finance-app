import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance/src/helper/helper.dart';
import 'package:finance/src/models/transaction_response.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });
  final TransactionResponse transaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: transaction.merchantLogo ?? '',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  Helper.formatTransactionDate(
                      transaction.time ?? DateTime.now()),
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Text(
            '-\$${transaction.amount ?? 0}',
            style: TextStyle(
              color: Color(0xFFff976b),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
