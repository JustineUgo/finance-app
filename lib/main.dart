import 'package:dio/dio.dart';
import 'package:finance/route/router.dart';
import 'package:finance/src/bloc/bloc.dart';
import 'package:finance/src/repository/repository.dart';
import 'package:finance/src/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final StackpalDioClient stackpalDioClient = StackpalDioClient(
      Dio(
        BaseOptions(
          baseUrl: "https://mocki.io/v1/",
          connectTimeout: const Duration(seconds: 20),
        ),
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (_) => TransactionBloc(
            repository: RepositoryImpl(stackpalDioClient),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
