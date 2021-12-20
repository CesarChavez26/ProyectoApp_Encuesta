import 'package:flutter/material.dart';
import 'package:preguntasapp/main.dart';
import 'package:preguntasapp/pages/login_page.dart';
import 'package:preguntasapp/pages/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'quizscreen': (_) => QuizScreen(),
  'login': (_) => SignIn(),
  'register': (_) => SignUp(),
};
