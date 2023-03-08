import 'package:flutter/material.dart';
import 'package:go_router_lecture/route/route_home.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteHome(),
    );
  }
}
