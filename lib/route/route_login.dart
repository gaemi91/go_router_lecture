import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/layout/layout_default.dart';
import 'package:go_router_lecture/provider/provider_auth.dart';

class RouteLogIn extends ConsumerWidget {
  const RouteLogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutDefault(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(stateNotifierProviderUser.notifier).logIn(name: '김종완');
          },
          child: const Text('로그인'),
        ),
      ],
    ));
  }
}
