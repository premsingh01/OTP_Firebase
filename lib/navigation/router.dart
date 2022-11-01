import 'package:flutter/material.dart';
import 'package:liveasyinterntask/modules/homepage/home_screen.dart';
import 'package:liveasyinterntask/modules/login/login_screen.dart';
import 'package:liveasyinterntask/modules/login/otp_screen.dart';
import 'package:liveasyinterntask/modules/profile/profile_screen.dart';
import 'route_constants.dart' as routes;

Route<dynamic>? onGenerateRoute(RouteSettings settings) {

  switch(settings.name) {

    case routes.HomeRoute :
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case routes.LoginRoute :
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case routes.OtpRoute :
      String? argument;
      if(settings.arguments is String) {
        argument = settings.arguments as String;
      }
      return MaterialPageRoute(builder: (_) => OtpScreen(mobileNumber: argument??'',));

    case routes.ProfileRoute :
      return MaterialPageRoute(builder: (_) => ProfileScreen());

  }

}