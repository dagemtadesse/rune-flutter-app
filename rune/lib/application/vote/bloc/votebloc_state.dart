part of 'votebloc_bloc.dart';

@immutable
abstract class VoteState<T> {}

class Voted<T> extends VoteState<T> {
  final dynamic artifact;

  Voted(this.artifact);
}
