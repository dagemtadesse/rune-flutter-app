import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'user_repo_test.mocks.dart';

class UserRepoTest extends Mock implements UserRepo {}

@GenerateMocks([UserRepoTest])
Future<void> main() async {
  late MockUserRepoTest userRepo;

  setUpAll(() {
    userRepo = MockUserRepoTest();
  });

  final loggedInUser = User(
          id: 1,
          fullName: "yeabsra",
          email: "email@email.com",
          updatedAt: DateTime.now(),
          role: "normal user");

  group('user repo test', () {

    //test login()
    test('test login', () async {
      when(userRepo.login(loggedInUser.email, "11223344"))
          .thenAnswer((_) async {
        return Expect(loggedInUser, null);
      });

      final res = await userRepo.login(loggedInUser.email, "11223344");

      expect(res, isA<Expect<User>>());
    });

    //test login() exception
    test('test login throws Exception', () {
      when(userRepo.login(loggedInUser.email, "11223344"))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = userRepo.login(loggedInUser.email, "11223344");

      expect(res, throwsException);
    });

    //register() test
    test('test register', () async {

      when(userRepo.register(loggedInUser.email,"11223344",loggedInUser.fullName)).thenAnswer((_) async {
        return Expect(loggedInUser,null);
      });

      final res = await userRepo.register(loggedInUser.email,"11223344",loggedInUser.fullName);

      expect(res, isA<Expect<User>>());
    });

    //test register() exception
    test('test register throws Exception', () {
      when(userRepo.register(loggedInUser.email,"11223344",loggedInUser.fullName)).thenAnswer((_) async {
        throw Exception();
      });

      final res = userRepo.register(loggedInUser.email,"11223344",loggedInUser.fullName);

      expect(res, throwsException);
    });

    //changePassword() test
    test('test changePassword', () async {
      
      when(userRepo.changePassword("pass","newpass",loggedInUser.email)).thenAnswer((_) async {
        return Expect(loggedInUser,null);
      });

      final res = await userRepo.changePassword("pass","newpass",loggedInUser.email);

      expect(res, isA<Expect<User>>());
    });

    //test changePassword() exception
    test('test changePassword throws Exception', () {
      when(userRepo.changePassword("pass","newpass",loggedInUser.email)).thenAnswer((_) async {
        throw Exception();
      });

      final res = userRepo.changePassword("pass","newpass",loggedInUser.email);

      expect(res, throwsException);
    });

    //getUser() test
    test('test getUser', () async {
      
      when(userRepo.getUser(loggedInUser.id)).thenAnswer((_) async {
        return Expect(loggedInUser,null);
      });

      final res = await userRepo.getUser(loggedInUser.id);

      expect(res, isA<Expect<User>>());
      });

    //test getUser() exception
    test('test getUser throws Exception', () {
      when(userRepo.getUser(loggedInUser.id)).thenAnswer((_) async {
        throw Exception();
      });

      final res = userRepo.getUser(loggedInUser.id);

      expect(res, throwsException);
    });

    //updateUser() test
    test('test updateUser', () async {
      
      when(userRepo.updateUser(fullname: loggedInUser.fullName, makeAdmin: true)).thenAnswer((_) async {
        return Expect(loggedInUser,null);
      });

      final res = await userRepo.updateUser(fullname: loggedInUser.fullName, makeAdmin: true);

      expect(res, isA<Expect<User>>());
    });

    //test updateUser() exception
    test('test getUser throws Exception', () {
      when(userRepo.updateUser(fullname: loggedInUser.fullName, makeAdmin: true)).thenAnswer((_) async {
        throw Exception();
      });

      final res = userRepo.updateUser(fullname: loggedInUser.fullName, makeAdmin: true);

      expect(res, throwsException);
    });
  });
}
