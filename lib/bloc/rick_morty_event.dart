part of 'rick_morty_bloc.dart';

@immutable
abstract class RickMortyEvent extends Equatable {
  const RickMortyEvent();
}

class LoadRickMortyEvent extends RickMortyEvent {
  @override
  List<Object> get props => [];
}
