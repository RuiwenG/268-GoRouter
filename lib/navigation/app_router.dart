import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../pages/login_page.dart';
import '../pages/author_page.dart';
import '../pages/title_page.dart';
import '../pages/profile_page.dart';
import '../pages/book_detail_page.dart';
import '../widgets/shell_screen.dart';
import './auth_change_notifier.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthenticationBloc authBloc) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: AuthChangeNotifier(authBloc), // 自定义的监听器
    redirect: (context, state) {
      final isLoggedIn = authBloc.state is Authenticated;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/byAuthor';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginPage(),
      ),
      // 将BookDetailPage移到外层routes
      GoRoute(
        path: '/byAuthor/detail',
        name: 'byAuthorDetail',
        builder: (context, state) => const BookDetailPage(),
      ),
      GoRoute(
        path: '/byTitle/detail',
        name: 'byTitleDetail',
        builder: (context, state) => const BookDetailPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            builder: (context, state) => AuthorPage(),
            // routes: [
            //   GoRoute(
            //     path: 'detail',
            //     name: 'byAuthorDetail',
            //     builder: (context, state) => BookDetailPage(),
            //   ),
            // ],
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            builder: (context, state) => TitlePage(),
            // routes: [
            //   GoRoute(
            //     path: 'detail',
            //     name: 'byTitleDetail',
            //     builder: (context, state) => BookDetailPage(),
            //   ),
            // ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
