import 'package:amar_wallet/module/add_card/add_card.dart';
import 'package:amar_wallet/module/home/home_page.dart';
import 'package:amar_wallet/module/search/search_page.dart';
import 'package:flutter/material.dart';

class Pages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
      case AppRoutes.searchPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SearchPage());
      case AppRoutes.addPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AddCardPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class AppRoutes {
  static const String initial = "/";
  static const String searchPage = "/search_page";
  static const String addPage = "/add_page";
}
