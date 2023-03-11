import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/layout/layout_default.dart';
import 'package:go_router_lecture/provider/provider_auth.dart';
import 'package:go_router_lecture/route/route_three.dart';

class RouteHome extends ConsumerWidget {
  const RouteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutDefault(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
            },
            child: const Text('Route One (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(RouteThree.routeName);
            },
            child: const Text('Route Three (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/error');
            },
            child: const Text('Route Error (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text('Route LogIn (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(stateNotifierProviderUser.notifier).logOut();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('LogOut'),
          ),
        ],
      ),
    );
  }
}
