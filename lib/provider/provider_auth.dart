import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_lecture/model/model_user.dart';
import 'package:go_router_lecture/route/route_error.dart';
import 'package:go_router_lecture/route/route_home.dart';
import 'package:go_router_lecture/route/route_login.dart';
import 'package:go_router_lecture/route/route_one.dart';
import 'package:go_router_lecture/route/route_three.dart';
import 'package:go_router_lecture/route/route_two.dart';

final providerRouter = Provider<GoRouter>((ref) {
  final stateProviderAuth = ChangeNotifierAuth(ref: ref);

  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return RouteError(error: state.error.toString());
    },
    redirect: (context, state) => stateProviderAuth._redirectLogic(state),
    refreshListenable: stateProviderAuth,
    routes: stateProviderAuth._routes,
  );
});

class ChangeNotifierAuth extends ChangeNotifier {
  final Ref ref;

  ChangeNotifierAuth({required this.ref}) {
    ref.listen<ModelUser?>(stateNotifierProviderUser, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(GoRouterState state) {
    //ModelUser의 인스턴스 또는 null이 들어오게 된다.
    final user = ref.read(stateNotifierProviderUser);

    //로그인을 하려는 상태인지
    final loggingIn = state.location == '/login';

    //유저 정보가 없다 -> 로그인을 한 상태가 아니다.

    //유저 정보가 없고 로그인하려는 상태도 아니라면 로그인 페이지로 이동한다.
    if (user == null) {
      // null을 반환한다는 것은 원래 가려던 페이지로 그대로 이동을 뜻한다.
      return loggingIn ? null : '/login';
    }
    //유저 정보가 있는데 로그인하는 페이지인 경우 홈으로 이동
    if (loggingIn) {
      return '/';
    }
    return null;
  }

  List<GoRoute> get _routes => [
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
        GoRoute(
          path: '/login',
          builder: (context, state) => const RouteLogIn(),
        ),
      ];
}

final stateNotifierProviderUser = StateNotifierProvider<StateNotifierUser, ModelUser?>((ref) {
  return StateNotifierUser();
});

// 로그인 상태면 ModelUser 인스턴스 상태로 넣어주기
// 로그아웃 상태면 Null 상태로 넣어주기
class StateNotifierUser extends StateNotifier<ModelUser?> {
  StateNotifierUser() : super(null);

  logIn({required String name}) {
    state = ModelUser(name: name);
  }

  logOut() {
    state = null;
  }
}
