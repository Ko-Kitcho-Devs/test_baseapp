// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:baseapp/src/domain/user/entities/user.dart' as _i9;
import 'package:baseapp/src/presentation/auth/sign_in/login.dart' as _i2;
import 'package:baseapp/src/presentation/home/home.dart' as _i1;
import 'package:baseapp/src/presentation/splash/splash.dart' as _i3;
import 'package:baseapp/src/presentation/user_pages/user_detail_page.dart'
    as _i4;
import 'package:baseapp/src/presentation/user_pages/user_form_page.dart' as _i5;
import 'package:baseapp/src/presentation/user_pages/user_list_page.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i8.Key? key,
    bool? withDeepLink,
    bool? fromLogout,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(
           key: key,
           withDeepLink: withDeepLink,
           fromLogout: fromLogout,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return _i3.SplashPage(
        key: args.key,
        withDeepLink: args.withDeepLink,
        fromLogout: args.fromLogout,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, this.withDeepLink, this.fromLogout});

  final _i8.Key? key;

  final bool? withDeepLink;

  final bool? fromLogout;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, withDeepLink: $withDeepLink, fromLogout: $fromLogout}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashRouteArgs) return false;
    return key == other.key &&
        withDeepLink == other.withDeepLink &&
        fromLogout == other.fromLogout;
  }

  @override
  int get hashCode =>
      key.hashCode ^ withDeepLink.hashCode ^ fromLogout.hashCode;
}

/// generated route for
/// [_i4.UserDetailPage]
class UserDetailRoute extends _i7.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i8.Key? key,
    required _i9.User user,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         UserDetailRoute.name,
         args: UserDetailRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'UserDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailRouteArgs>();
      return _i4.UserDetailPage(key: args.key, user: args.user);
    },
  );
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({this.key, required this.user});

  final _i8.Key? key;

  final _i9.User user;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserDetailRouteArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [_i5.UserFormPage]
class UserFormRoute extends _i7.PageRouteInfo<UserFormRouteArgs> {
  UserFormRoute({
    _i8.Key? key,
    _i9.User? user,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         UserFormRoute.name,
         args: UserFormRouteArgs(key: key, user: user),
         initialChildren: children,
       );

  static const String name = 'UserFormRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserFormRouteArgs>(
        orElse: () => const UserFormRouteArgs(),
      );
      return _i5.UserFormPage(key: args.key, user: args.user);
    },
  );
}

class UserFormRouteArgs {
  const UserFormRouteArgs({this.key, this.user});

  final _i8.Key? key;

  final _i9.User? user;

  @override
  String toString() {
    return 'UserFormRouteArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserFormRouteArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [_i6.UserListPage]
class UserListRoute extends _i7.PageRouteInfo<void> {
  const UserListRoute({List<_i7.PageRouteInfo>? children})
    : super(UserListRoute.name, initialChildren: children);

  static const String name = 'UserListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.UserListPage();
    },
  );
}
