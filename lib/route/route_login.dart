import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/layout/layout_default.dart';

class RouteLogIn extends StatelessWidget {
  const RouteLogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
        body: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('홈으로'),
        )
      ],
    ));
  }
}
