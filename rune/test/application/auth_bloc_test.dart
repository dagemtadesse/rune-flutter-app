import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/auth/bloc/auth_bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  group('LoginRequest', () {
    final user = User(
        id: 1,
        fullName: "Naomi Tim",
        email: "naomi@mail.com",
        updatedAt: DateTime.now(),
        role: "Admin");
    test('emits authrequestsent -> authrequestsucessful when sucessful', () {
      when(mockUserRepository
          .login(any.toString(), any.toString())
          .then((_) async => user));

      final authBloc = AuthBloc(userRepository: mockUserRepository);
      authBloc.add(LoginRequest(user.email, "12345678"));

      expectLater(
          authBloc.stream,
          emitsInOrder([
            NoAuthRequestSent(),
            AuthRequestSent(),
            AuthRequestSuccess(user),
            AuthRequestSuccessWithMessage(user, "User logged in sucessfully")
          ]));
    });
  });
}
