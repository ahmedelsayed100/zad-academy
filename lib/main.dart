import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_academy/hub/widgets/routes.dart';
import 'package:zad_academy/services/level_provider.dart';

import 'hub/widgets/app_theme.dart';
import 'views/main_views/home_view_1.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LevelProvider();
      },
      child: MaterialApp(
        themeMode: ThemeMode.system,
        title: 'Zad Academy',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routes: myRoutes,
        home: const HomePageView(),
      ),
    );
  }
}

// return MultiProvider(
// providers: [
// ChangeNotifierProvider(
// create: (context) => ConnectivityProvider(),
// child: const VideoView(),
// ),
// ChangeNotifierProvider(
// create: (context) => ConnectivityProvider(),
// child: const AcademySiteView(),
// ),
// ChangeNotifierProvider(
// create: (context) => ConnectivityProvider(),
// child: const BookView(),
// ),
// ChangeNotifierProvider(
// create: (context) => ConnectivityProvider(),
// child: const AudioPlayerView(audioUrl: "", lessonLabel: ""),
// ),
// ChangeNotifierProvider(
// create: (context) => ConnectivityProvider(),
// child: const BookView(),
// ),
// ],
