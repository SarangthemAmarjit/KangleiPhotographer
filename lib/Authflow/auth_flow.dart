import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangleiphotographers/controller/tapcontroller.dart';

import 'package:kangleiphotographers/router/router.dart';

@RoutePage()
class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    final FirebaseAuth auth = FirebaseAuth.instance;
    controller.checkuser();
    return GetBuilder<GetxTapController>(builder: (_) {
      return AutoRouter.declarative(routes: (context) {
        if (auth.currentUser == null) {
          return [
            const LoginRoute()
            // const AppUpdaterRoute()
          ];
        } else if (controller.isuserexist == null) {
          return [const LoadingRoute()];
        } else if (controller.isuserexist) {
          return [const HomeRoute()];
        } else {
          return [CreateAccountRoute()];
        }
      });
    });
  }
}
