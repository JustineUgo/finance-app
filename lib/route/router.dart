import 'package:finance/src/models/transaction_response.dart';
import 'package:finance/src/screens/details_screen.dart';
import 'package:finance/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RoutePath.details,
      builder: (BuildContext context, GoRouterState state) {
        try {
        TransactionResponse  transaction = state.extra as TransactionResponse;
        return DetailsScreen(transaction: transaction);  
        } catch (e) {
          return const HomeScreen();
        }
      },
    ),
  ],
);

class RoutePath {
  static const String home = '/';
  static const String details = '/details';
}
