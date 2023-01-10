import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_academy/hub/widgets/routes.dart';
import 'package:zad_academy/services/connectivity_provider.dart';
import 'hub/widgets/app_theme.dart';
import 'views/content_views/academy_site_view.dart';
import 'views/content_views/audio_player_view.dart';
import 'views/content_views/book_view.dart';
import 'views/content_views/videos_view.dart';
import 'views/main_views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: const VideoView(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: const AcademySiteView(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: const BookView(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: const AudioPlayerView(audioUrl: "", lessonLabel: ""),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: const BookView(),
        ),
      ],
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
