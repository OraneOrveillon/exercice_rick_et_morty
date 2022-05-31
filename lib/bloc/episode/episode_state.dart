part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState extends Equatable {}

class EpisodeLoadingState extends EpisodeState {
  @override
  List<Object?> get props => [];
}

class EpisodeLoadedState extends EpisodeState {
  final RickMortyEpisode episode;

  EpisodeLoadedState(this.episode);

  @override
  List<Object?> get props => [episode];
}

class EpisodeErrorState extends EpisodeState {
  final String error;

  EpisodeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
