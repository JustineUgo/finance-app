import 'package:equatable/equatable.dart';
import 'package:finance/src/models/transaction_response.dart';


class TransactionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState{}

class TransactionLoading extends TransactionState{}

class TransactionLoaded extends  TransactionState{
  final List<TransactionResponse> transactions;

  TransactionLoaded({ required this.transactions});
}
class TransactionError extends TransactionState {
  final dynamic error;
  TransactionError({required this.error});
}

