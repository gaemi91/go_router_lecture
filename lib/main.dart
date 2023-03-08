import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/route/route_home.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(path: '/', builder: (context, state) => const RouteHome()),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // URI String을 상태 및 Go Router에서 사용할 수 있는 상태로 변환해주는 함수.
      routeInformationParser: _router.routeInformationParser,
      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수.
      routerDelegate: _router.routerDelegate,
      // Route 정보를 전달하는 역할
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
