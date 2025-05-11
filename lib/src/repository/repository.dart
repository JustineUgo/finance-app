import 'package:finance/src/service/network_service.dart';

abstract class Repository {
  Future<dynamic> getTransactions();
}

class RepositoryImpl implements Repository {
  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  @override
  Future getTransactions() async {
    final result = await networkService.makeRequest(
      "f5d68536-1f58-4be5-8266-248b440503e2",
      mode: NetworkMethod.get,
    );
    return result;
  }
}
