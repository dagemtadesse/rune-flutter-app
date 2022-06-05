import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/channel/bloc/channel_bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockChannelRepository extends Mock implements ChannelRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockChannelRepository mockChannelRepository;
  late MockUserRepository mockUserRepository;
  mockUserRepository = MockUserRepository();

  setUp(() {
    mockChannelRepository = MockChannelRepository();
  });

  group('LoadChannels', () {
    final user = User(
        id: 1,
        fullName: "Naomi Tim",
        email: "naomi@mail.com",
        updatedAt: DateTime.now(),
        role: "Admin");
    final channel = Channel(
        id: 1,
        authorId: 2,
        name: "Mechanical Engineering",
        description: "this is a channel for mech.Eng",
        verified: true,
        updatedAt: DateTime.now(),
        pinned: true);

    test('emits states: channelLoading -> channelLoadedSucessfully', () {
      when(mockChannelRepository
          .getChannel(user: user, channelId: channel.id)
          .then((_) async => channel));
    });

    final channelBloc = ChannelBloc(mockChannelRepository, mockUserRepository);
    channelBloc.add(LoadChannels());

    expectLater(
        channelBloc,
        emitsInOrder(
            [ChannelLoading(), ChannelLoadedSuccessfuly(channels: [])]));
    // TO DO : fix the channels: []
  });
}
