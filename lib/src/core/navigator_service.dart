import 'package:flutter/material.dart';

class NavigatorService {
  final _key = GlobalKey<NavigatorState>();

  static final NavigatorService _instance = NavigatorService._();

  NavigatorService._();

  static NavigatorService get instance {
    return _instance;
  }

  GlobalKey<NavigatorState> get key => _key;
}
