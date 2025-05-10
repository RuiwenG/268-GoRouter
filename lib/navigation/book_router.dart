import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/bloc/authentication_bloc.dart';
import 'package:hw4/pages/by_author_page.dart';
import 'package:hw4/pages/by_title_page.dart';
import 'package:hw4/pages/home_page.dart';
import 'package:hw4/pages/login_page.dart';
import 'package:hw4/pages/profile_page.dart';
import 'package:hw4/utilities/stream_to_listenable.dart';
import 'package:hw4/widgets/scaffold_with_nav_bar.dart';

class RouteName {
  static const home = 'home';
  static const byAuthor = 'byAuthor';
  static const byAuthorDetail = 'detail';
  static const byTitle = 'byTitle';
  static const byTileDetail = 'detail';
  static const profile = 'profile';
  static const login = 'login';
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Root",
);
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Shell",
);

GoRouter bookRouter(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith("/login") ?? false))) {
        return "/login";
      } else {
        if ((state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedIn) {
          return "/byAuthor";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: <RouteBase>[
              // need by author detail page
              GoRoute(
                path: '/byAuthor',
                name: RouteName.byAuthor,
                builder: (BuildContext context, GoRouterState state) {
                  return const ByAuthorPage();
                },
              ),
              // also need by title detail
              GoRoute(
                path: '/byTitle',
                name: RouteName.byTitle,
                builder: (BuildContext context, GoRouterState state) {
                  return const ByTitlePage();
                },
              ),
              GoRoute(
                path: '/profile',
                name: RouteName.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
