part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharactersLoadingState extends CharactersState {
  @override
  List<Object?> get props => [];
}

class CharactersLoadedState extends CharactersState {
  final RickMortyCharacters characters;

  CharactersLoadedState(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharactersErrorState extends CharactersState {
  final String error;

  CharactersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
