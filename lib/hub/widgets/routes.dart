import 'package:flutter/material.dart';

import '../../views/content_views/audio/audio_player_view.dart';
import '../../views/content_views/audio/audio_view.dart';
import '../../views/content_views/book/book_view.dart';
import '../../views/content_views/video/videos_view.dart';
import '../../views/content_views/website/academy_site_view.dart';
import '../../views/main_views/home_view_1.dart';
import '../../views/main_views/material_view_3.dart';
import '../../views/main_views/subjects_view_2.dart';
import '../../views/secondary_views/about_app_view.dart';
import '../../views/secondary_views/terms_privacy_view.dart';

Map<String, WidgetBuilder> myRoutes = {
  HomePageView.id: (_) => const HomePageView(),
  SubjectView.id: (_) => const SubjectView(),
  MaterialView.id: (_) => const MaterialView(),
  BookView.id: (_) => const BookView(),
  VideoView.id: (_) => const VideoView(),
  AudioView.id: (_) => const AudioView(),
  AcademySiteView.id: (_) => const AcademySiteView(),
  AboutAppView.id: (_) => const AboutAppView(),
  TermsPrivacyView.id: (_) => TermsPrivacyView(),
  // AudioPlayerView.id: (_) => const AudioPlayerView(),
};
