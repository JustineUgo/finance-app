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
      "e81f5319-5f6c-4f5d-8a92-6b331b09c51e",
      mode: NetworkMethod.get,
    );
    return result;
  }
}
