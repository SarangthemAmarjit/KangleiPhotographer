import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kangleiphotographers/Authflow/auth_flow.dart';
import 'package:kangleiphotographers/pages/createaccount.dart';
import 'package:kangleiphotographers/pages/dashboard.dart';
import 'package:kangleiphotographers/pages/loadingpage.dart';
import 'package:kangleiphotographers/pages/loginpage.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthFlowRoute.page, path: '/', children: [
          AutoRoute(
            page: LoginRoute.page,
          ),
          AutoRoute(page: CreateAccountRoute.page),
          AutoRoute(page: LoadingRoute.page),
          AutoRoute(
            page: HomeRoute.page,
          ),
        ]),
        AutoRoute(page: LoginRoute.page, path: '/loginpage'),
        AutoRoute(page: CreateAccountRoute.page, path: '/createaccountpage'),
        AutoRoute(page: LoadingRoute.page, path: '/loadingpage'),
        AutoRoute(page: HomeRoute.page, path: '/homepage')

        /// routes go here
      ];
}
