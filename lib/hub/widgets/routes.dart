import 'package:flutter/material.dart';

import '../../views/content_views/academy_site_view.dart';
import '../../views/content_views/audio_player_view.dart';
import '../../views/content_views/audio_view.dart';
import '../../views/content_views/book_view.dart';
import '../../views/content_views/categories_view.dart';
import '../../views/content_views/course_view.dart';
import '../../views/content_views/videos_view.dart';
import '../../views/main_views/about_app_view.dart';
import '../../views/main_views/home_view.dart';
import '../../views/main_views/terms_privacy_view.dart';

Map<String, WidgetBuilder> myRoutes = {
  HomePageView.id: (_) => const HomePageView(),
  CategoriesView.id: (_) => const CategoriesView(),
  CourseView.id: (_) => const CourseView(),
  BookView.id: (_) => const BookView(),
  VideoView.id: (_) => const VideoView(),
  AudioView.id: (_) => const AudioView(),
  AcademySiteView.id: (_) => const AcademySiteView(),
  AboutAppView.id: (_) => const AboutAppView(),
  TermsPrivacyView.id: (_) => TermsPrivacyView(),
  AudioPlayerView.id: (_) => const AudioPlayerView(
        audioUrl: "",
        lessonLabel: "",
      ),
};
