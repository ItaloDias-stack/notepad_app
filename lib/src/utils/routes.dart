import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:notepad_app/src/presentation/pages/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
};
