part of 'votebloc_bloc.dart';

@immutable
abstract class VoteEvent {}

class Vote extends VoteEvent {
  final String type;
  final String artifactType;
  final dynamic artifact;

  Vote(this.type, this.artifact, {this.artifactType = "post"});
}
