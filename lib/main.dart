import 'package:coding_challenge/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:coding_challenge/feature/login/presentation/page/login_page.dart';
import 'package:coding_challenge/injection_conainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => locator<LoginBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGeneratedRoutes,
          title: 'Flutter Demo',
          theme: getTheme(),
          home: const Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: LoginPage(),
            ),
          ),
        ));
  }

  ThemeData getTheme() {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      canvasColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color.fromRGBO(65, 171, 158, 1),
        selectionColor: Color.fromRGBO(65, 171, 158, 1),
        selectionHandleColor: Color.fromRGBO(65, 171, 158, 1),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: createMaterialColor(Colors.white))
          .copyWith(
        secondary: createMaterialColor(const Color.fromRGBO(65, 171, 158, 1)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
        ),
      ),
      primaryColor: const Color.fromRGBO(65, 171, 158, 1),
      primaryColorLight: const Color.fromRGBO(65, 171, 158, 1),
      primaryColorDark: Colors.white,
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
