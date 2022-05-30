import 'package:equatable/equatable.dart';
import 'package:exercice_rick_et_morty/data/model/rick_morty_model.dart';
import 'package:exercice_rick_et_morty/data/repository/rick_morty_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'rick_morty_event.dart';
part 'rick_morty_state.dart';

class RickMortyBloc extends Bloc<RickMortyEvent, RickMortyState> {
  final RickMortyRepository _rickMortyRepository;

  RickMortyBloc(this._rickMortyRepository) : super(RickMortyLoadingState()) {
    on<LoadRickMortyEvent>((event, emit) async {
      emit(RickMortyLoadingState());
      try {
        final solarSystem = await _rickMortyRepository.getCharacters();
        emit(RickMortyLoadedState(solarSystem));
      } catch (e) {
        emit(RickMortyErrorState(e.toString()));
      }
    });
  }
}
