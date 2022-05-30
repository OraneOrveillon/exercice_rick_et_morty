part of 'rick_morty_bloc.dart';

@immutable
abstract class RickMortyState extends Equatable {}

class RickMortyLoadingState extends RickMortyState {
  @override
  List<Object?> get props => [];
}

class RickMortyLoadedState extends RickMortyState {
  final RickMorty rickMorty;

  RickMortyLoadedState(this.rickMorty);

  @override
  List<Object?> get props => [rickMorty];
}

class RickMortyErrorState extends RickMortyState {
  final String error;

  RickMortyErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
