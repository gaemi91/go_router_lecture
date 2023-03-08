import 'package:flutter/material.dart';
import 'package:go_router_lecture/layout/layout_default.dart';

class RouteThree extends StatelessWidget {
  static String get routeName => 'three';

  const RouteThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(body: Container());
  }
}
