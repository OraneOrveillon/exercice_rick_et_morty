import 'package:equatable/equatable.dart';
import 'package:exercice_rick_et_morty/data/model/episode_model.dart';
import 'package:exercice_rick_et_morty/data/repository/episode_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository _episodeRepository;

  EpisodeBloc(this._episodeRepository) : super(EpisodeLoadingState()) {
    on<LoadEpisodeEvent>((event, emit) async {
      emit(EpisodeLoadingState());
      try {
        final episode = await _episodeRepository.getHttp();
        emit(EpisodeLoadedState(episode));
      } catch (e) {
        emit(EpisodeErrorState(e.toString()));
      }
    });
  }
}
