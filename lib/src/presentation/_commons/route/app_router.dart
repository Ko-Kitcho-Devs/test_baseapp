import 'package:auto_route/auto_route.dart';

import '../../auth/sign_in/login.dart';
import '../../home/home.dart';
import '../../splash/splash.dart';
import '../../user_pages/user_detail_page.dart';
import '../../user_pages/user_form_page.dart';
import '../../user_pages/user_list_page.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   page: SplashRoute.page,
    //   initial: true,
    //   path: SplashPage.routeName,
    // ),
    AutoRoute(
      page: UserListRoute.page,
      initial: true,
      path: UserListPage.routeName,
    ),
    AutoRoute(page: HomeRoute.page, path: HomePage.routeName),
    AutoRoute(page: LoginRoute.page, path: LoginPage.routeName),
    // AutoRoute(page: UserListRoute.page, path: UserListPage.routeName ,),
    AutoRoute(page: UserFormRoute.page, path: UserFormPage.routeName,),
    
    AutoRoute(page: UserDetailRoute.page, path: UserDetailPage.routeName,),

  ];
}
