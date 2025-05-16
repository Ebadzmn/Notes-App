import 'package:go_router/go_router.dart';
import 'package:notesapp/feature/auth/ui/screens/sign_in_screen.dart';
import 'package:notesapp/feature/auth/ui/screens/sign_up_screen.dart';
import 'package:notesapp/feature/home/ui/screens/add_newnote_screen.dart';
import 'package:notesapp/feature/home/ui/screens/home_screen.dart';
import 'package:notesapp/feature/home/ui/screens/splash_screen.dart';
import '';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/home',
      builder : (context,state) => HomeScreen()
  ),
  GoRoute(
      path: '/signIn',
      builder : (context,state) => SignInScreen()
  ),
  GoRoute(
      path: '/signUp',
      builder : (context,state) => SignUpScreen()
  ),
  GoRoute(
      path: '/',
      builder : (context,state) => SplashScreen()
  ),
  GoRoute(
      path: '/addNew',
      builder : (context,state) => AddNewNote()
  ),
]);