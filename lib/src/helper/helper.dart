import 'package:finance/src/models/transaction_response.dart';
import 'package:intl/intl.dart';

class Helper {
  const Helper._();

  static String getErrorMessage(dynamic error) {
    if (error is String) {
      return error;
    }
    if (error is List) {
      return error.join('\n');
    }

    String? errorMessage;
    error.forEach((key, value) {
      if (value is List) {
        for (var message in value) {
          errorMessage =
              "${errorMessage == null ? '' : '$errorMessage\n'}$message";
        }
      } else if (value is String) {
        errorMessage = value;
      }
    });
    return errorMessage ?? 'An error occurred. Please try again.';
  }


static String formatTransactionDate(DateTime? createdAt) {
  if (createdAt == null) return '';

  final now = DateTime.now();
  final isToday = createdAt.year == now.year &&
      createdAt.month == now.month &&
      createdAt.day == now.day;

  final timeFormat = DateFormat('h:mm a'); // e.g., 11:30 AM
  final fullDateFormat = DateFormat('d MMM, yyyy'); // e.g., 23 Mar, 2025

  if (isToday) {
    return 'Today, ${timeFormat.format(createdAt)}';
  } else {
    return '${fullDateFormat.format(createdAt)}; ${timeFormat.format(createdAt)}';
  }
}
static double calculateTotalAmount(List<TransactionResponse> transactions) {
  return transactions.fold(
    0.0,
    (sum, tx) => sum + (tx.amount ?? 0),
  );
}

static List<TransactionResponse> filterTransactionsByMonth(
  List<TransactionResponse> allTransactions,
  int index,
) {
  if(index==0){
    return allTransactions;
  }
  

  return allTransactions.where((tx) {
    final date = tx.time;
    return date != null && date.month == index;
  }).toList();
}


}
