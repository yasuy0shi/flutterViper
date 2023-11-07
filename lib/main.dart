import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterViper/utils/shared_preference.dart';
import 'package:flutterViper/view/landing_page.dart';
import 'package:flutterViper/view/my_page.dart';
import 'package:flutterViper/view/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  prefs.init();

  Future.delayed(const Duration(milliseconds: 200), () {
    bool loggedIn = isLoggedIn;

    runApp(ProviderScope(child: MyApp(isLoggedIn: loggedIn)));
  });
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, this.isLoggedIn = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VIPER',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(34, 52, 85, 1.0),
          onPrimary: Colors.white,
          secondary: Color.fromRGBO(241, 249, 255, 1.0),
          onSecondary: Colors.transparent,
          background: Color.fromRGBO(249, 245, 240, 1.0),
          onBackground: Colors.transparent,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.transparent,
          onSurface: Colors.transparent,
          surface: Colors.white,
        ),
        canvasColor: const Color.fromRGBO(34, 52, 85, 1),
        cardColor: const Color.fromRGBO(241, 249, 255, 1),
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.montserrat(color: Colors.white),
          headlineMedium: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(34, 52, 85, 1),
            ),
          ),
        ),
      ),
      home: isLoggedIn ? const MyPage() : const LandingPage(),
      routes: {
        '/landing': (BuildContext context) => const LandingPage(),
        '/sign_in': (BuildContext context) => const SignInPage(),
        '/my': (BuildContext context) => const MyPage(),
      },
    );
  }
}
