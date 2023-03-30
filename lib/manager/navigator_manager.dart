import 'package:flutter/material.dart';

class NavigatorManager {
  // geriye birşey döndürmüyoruz
  void navigatToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }

  // geriye birşey döndürüyoruz...
  Future<T?> navigatToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }
}
