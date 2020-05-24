import 'package:client/ui/favourites_page.dart';
import 'package:client/ui/followings_page.dart';
import 'package:client/ui/guest_page.dart';
import 'package:client/ui/home_page.dart';
import 'package:client/ui/images_page.dart';
import 'package:client/ui/member_wrapper.dart';
import 'package:client/ui/progresses_page.dart';
import 'package:client/ui/user_edit_page.dart';
import 'package:client/ui/user_info_page.dart';
import 'package:client/ui/users_page.dart';
import 'package:client/ui/work_edit_page.dart';
import 'package:client/ui/work_info_page.dart';
import 'package:client/ui/work_new_page.dart';
import 'package:client/ui/works_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/': return MaterialPageRoute(builder: (context) => GuestPage());
      case '/home': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: HomePage(),));

      case '/users': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: UsersPage()));
      case '/user': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: UserInfoPage(id: args)));
      case '/profile': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: UserInfoPage(id: null)));

      case '/works': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: WorksPage()));
      case '/work': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: WorkInfoPage(id: args)));

      case '/followings': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: FollowingsPage()));
      case '/favourites': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: FavouritesPage()));
      case '/progresses': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: ProgressesPage()));

      // nested
      case '/user_edit': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: UserEditPage()));

      case '/work_new': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: WorkNewPage()));
      case '/work_edit': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: WorkEditPage(id: args,)));

      case '/images': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: ImagesPage(id: args,)));
      case '/audios': return MaterialPageRoute(builder: (context) => MemberWrapper(widget: ImagesPage(id: args,)));
    }
  }

}