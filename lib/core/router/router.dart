import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/services/network_services.dart';
import 'package:note/data/data_source/remote_data_source.dart';
import 'package:note/domain/repository/get_notes_repository.dart';
import 'package:note/presentation/contoller/note_cubit.dart';
import 'package:note/presentation/screens/edit_note_view.dart';
import 'package:note/presentation/screens/splash_view.dart';

import '../../presentation/screens/home_view.dart';

class Routes {
  static const String homeViewRoute = "HomeView";
  static const String splashViewRoute = "SplashView";
  static const String editNoteViewRoute = "EditNoteView";
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => NoteCubit(
                    NotesRepositoryImpl(
                        RemoteDataSourceImpl(NetworkServicesImpl())),
                  )..getNotes(),
                  child: const HomeView(),
                ),
            settings: settings);

      case Routes.editNoteViewRoute:
        return MaterialPageRoute(
            builder: (_) => const EditNoteView(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => const SplashView(), settings: settings);
    }
  }
}
