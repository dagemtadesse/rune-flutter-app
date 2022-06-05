import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/main.dart';
import 'channel_repo_test.mocks.dart';
import '../user_repository/user_repo_test.dart';


class ChannelRepoTest extends Mock implements ChannelRepo {}

@GenerateMocks([ChannelRepoTest])
Future<void> main() async {
  late MockChannelRepoTest channelRepo;

  setUpAll(() {
    channelRepo = MockChannelRepoTest();
  });

  final channel = Channel(
      id: 12,
      authorId: 33,
      name: "SITE",
      description: "a group to share your ideas about the SITE department",
      verified: true,
      updatedAt: DateTime.now(),
      pinned: false,
      address: "addis ababa",
      email: "email@email.com",
      logo: null);

  final channelList = [channel];
  final loggedInUser = User(
        id: 1,
        fullName: "yeabsra",
        email: "email@email.com",
        updatedAt: DateTime.now(),
        role: "normal user");
  group('comment repo test', () {
    //test getChannels()
    test('test getChannels', () async {
      when(channelRepo.getChannels())
          .thenAnswer((_) async {
        return Expect(channelList, null);
      });

      final res = await channelRepo.getChannels();

      expect(res, isA<Expect<List<Channel>>>());
    });

    //test getChannels() exception
    test('test getChannels throws Exception', () {
      when(channelRepo.getChannels()).thenAnswer((_) async {
        throw Exception();
      });

      final res = channelRepo.getChannels();
      expect(res, throwsException);
    });

    //test getChannel()
    test('test getChannel', () async {
      when(channelRepo.getChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        return Expect(channel, null);
      });

      final res = await channelRepo.getChannel(user: loggedInUser,channelId: channel.id);

      expect(res, isA<Expect<Channel>>());
    });

    //test getChannel() exception
    test('test getChannel throws Exception', () {
      when(channelRepo.getChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        throw Exception();
      });

      final res = channelRepo.getChannel(user: loggedInUser,channelId: channel.id);
      expect(res, throwsException);
    });    

    //test pinChannel()
    test('test pinChannel', () async {
      when(channelRepo.pinChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        return Expect(channel, null);
      });

      final res = await channelRepo.pinChannel(user: loggedInUser,channelId: channel.id);

      expect(res, isA<Expect<Channel>>());
    });

    //test pinChannel() exception
    test('test pinChannel throws Exception', () {
      when(channelRepo.pinChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        throw Exception();
      });

      final res = channelRepo.pinChannel(user: loggedInUser,channelId: channel.id);
      expect(res, throwsException);
    });    

    //test removeChannel()
    test('test removeChannel', () async {
      when(channelRepo.removeChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        return Expect(true, null);
      });

      final res = await channelRepo.removeChannel(user: loggedInUser,channelId: channel.id);

      expect(res, isA<Expect<bool>>());
    });

    //test removeChannel() exception
    test('test removeChannel throws Exception', () {
      when(channelRepo.removeChannel(user: loggedInUser,channelId: channel.id)).thenAnswer((_) async {
        throw Exception();
      });

      final res = channelRepo.removeChannel(user: loggedInUser,channelId: channel.id);
      expect(res, throwsException);
    });  

    //test createChannel()
    test('test createChannel', () async {
      when(channelRepo.createChannel(userRepository,channel.name,channel.description,channel.address,channel.email)).thenAnswer((_) async {
        return Expect(channel, null);
      });

      final res = await channelRepo.createChannel(userRepository,channel.name,channel.description,channel.address,channel.email);

      expect(res, isA<Expect<Channel>>());
    });

    //test createChannel() exception
    test('test createChannel throws Exception', () {
      when(channelRepo.createChannel(userRepository,channel.name,channel.description,channel.address,channel.email)).thenAnswer((_) async {
        throw Exception();
      });

      final res = channelRepo.createChannel(userRepository,channel.name,channel.description,channel.address,channel.email);
      expect(res, throwsException);
    });   
  });
}
