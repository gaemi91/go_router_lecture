import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/route/route_error.dart';
import 'package:go_router_lecture/route/route_home.dart';
import 'package:go_router_lecture/route/route_one.dart';
import 'package:go_router_lecture/route/route_three.dart';
import 'package:go_router_lecture/route/route_two.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        errorBuilder: (context, state) {
          return RouteError(error: state.error.toString());
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const RouteHome(),
            routes: [
              GoRoute(
                path: 'one',
                builder: (context, state) => const RouteOne(),
                routes: [
                  GoRoute(
                    path: 'two',
                    builder: (context, state) => const RouteTwo(),
                    routes: [
                      GoRoute(
                        path: 'three',
                        name: RouteThree.routeName,
                        builder: (context, state) => const RouteThree(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
