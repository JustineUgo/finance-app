import 'package:finance/src/bloc/event.dart';
import 'package:finance/src/bloc/state.dart';
import 'package:finance/src/models/transaction_response.dart';
import 'package:finance/src/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final Repository repository;
  TransactionBloc({required this.repository}) : super(TransactionInitial()) {
    on<GetTransactions>(_getTransactions);
  }

  Future _getTransactions(
      GetTransactions event, Emitter<TransactionState> emit) async {
    try {
      emit(TransactionLoading());
      List response =
          await repository.getTransactions();

      emit(
        TransactionLoaded(
          transactions: List.generate(response.length,
              (index) => TransactionResponse.fromJson(response[index])),
        ),
      );
    } catch (error) {
      error;
      emit(TransactionError(error: error));
    }
  }
}
