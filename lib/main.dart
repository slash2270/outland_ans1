import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outland/route/router.dart';
import 'package:outland/state/provider/course_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CourseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: const MaterialColor(
                0xFF000000,
                <int, Color>{
                  50: Colors.blue,
                  100: Colors.blue,
                  200: Colors.blue,
                  300: Colors.blue,
                  400: Colors.blue,
                  500: Colors.blue,
                  600: Colors.blue,
                  700: Colors.blue,
                  800: Colors.blue,
                  900: Colors.blue,
                },
              ),
              pageTransitionsTheme: const PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
                  }),
            ),
        ),
      )
    );
  }
}