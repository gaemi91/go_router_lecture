import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/layout/layout_default.dart';

class RouteError extends StatelessWidget {
  final String error;

  const RouteError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
        body: Column(
      children: [
        Text(error),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: Text('홈으로'),
        )
      ],
    ));
  }
}
