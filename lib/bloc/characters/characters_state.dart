part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharactersLoadingState extends CharactersState {
  @override
  List<Object?> get props => [];
}

class CharactersLoadedState extends CharactersState {
  final RickMortyCharacters rickMorty;

  CharactersLoadedState(this.rickMorty);

  @override
  List<Object?> get props => [rickMorty];
}

class CharactersErrorState extends CharactersState {
  final String error;

  CharactersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
