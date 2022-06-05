import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  group('UpdateUser', () {
    final user = User(
        id: 1,
        fullName: "Naomi Tim",
        email: "naomi@mail.com",
        updatedAt: DateTime.now(),
        role: "Admin");

    test(
        'emits states: UserUpdating() -> UserUpdateSuccessful(), when sucessful',
        () {
      when(mockUserRepository.getUser(user.id).then((_) async => user));
    });

    final userBloc = UserBloc(mockUserRepository);
    userBloc.add(UpdateProfile(user.fullName, user.email, user.handle));

    expectLater(userBloc,
        emitsInOrder([UserIdle(), UserUpdating(), UserUpdateSuccessful()]));
  });
}
