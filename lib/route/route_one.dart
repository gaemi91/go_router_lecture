import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/layout/layout_default.dart';

class RouteOne extends StatelessWidget {
  const RouteOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('pop!'),
          )
        ],
      ),
    );
  }
}
