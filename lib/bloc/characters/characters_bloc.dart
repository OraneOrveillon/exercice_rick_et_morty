import 'package:equatable/equatable.dart';
import 'package:exercice_rick_et_morty/data/model/characters_model.dart';
import 'package:exercice_rick_et_morty/data/repository/characters_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _charactersRepository;

  CharactersBloc(this._charactersRepository) : super(CharactersLoadingState()) {
    on<LoadCharactersEvent>((event, emit) async {
      emit(CharactersLoadingState());
      try {
        final characters = await _charactersRepository.getHttp();
        emit(CharactersLoadedState(characters));
      } catch (e) {
        emit(CharactersErrorState(e.toString()));
      }
    });
  }
}
