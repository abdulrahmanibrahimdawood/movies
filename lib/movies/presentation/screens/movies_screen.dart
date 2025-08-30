import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies/movies/presentation/controllers/movies_event.dart';
import 'package:movies/movies/presentation/controllers/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) {
        return MoviesBloc(sl())..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}
