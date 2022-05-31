part of 'episode_bloc.dart';

@immutable
abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();
}

class LoadEpisodeEvent extends EpisodeEvent {
  @override
  List<Object> get props => [];
}
