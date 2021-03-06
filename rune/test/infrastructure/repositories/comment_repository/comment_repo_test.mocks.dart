// Mocks generated by Mockito 5.2.0 from annotations
// in rune/test/infrastructure/repositories/comment_repository/comment_repo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rune/domain/models.dart' as _i2;
import 'package:rune/infrastructure/repositories.dart' as _i5;

import 'comment_repo_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeExpect_0<T> extends _i1.Fake implements _i2.Expect<T> {}

/// A class which mocks [CommentRepoTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCommentRepoTest extends _i1.Mock implements _i3.CommentRepoTest {
  MockCommentRepoTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Expect<List<_i2.Comment>>> fetchComments(
          _i5.UserRepository? userRepository, int? postId) =>
      (super.noSuchMethod(
              Invocation.method(#fetchComments, [userRepository, postId]),
              returnValue: Future<_i2.Expect<List<_i2.Comment>>>.value(
                  _FakeExpect_0<List<_i2.Comment>>()))
          as _i4.Future<_i2.Expect<List<_i2.Comment>>>);
  @override
  _i4.Future<_i2.Expect<_i2.Comment>> addComment(
          _i5.UserRepository? userRepository, int? postId, String? content) =>
      (super.noSuchMethod(
              Invocation.method(#addComment, [userRepository, postId, content]),
              returnValue: Future<_i2.Expect<_i2.Comment>>.value(
                  _FakeExpect_0<_i2.Comment>()))
          as _i4.Future<_i2.Expect<_i2.Comment>>);
  @override
  _i4.Future<_i2.Expect<_i2.Comment>> voteComment(
          _i5.UserRepository? userRepository, int? commentId, String? type) =>
      (super.noSuchMethod(
          Invocation.method(#voteComment, [userRepository, commentId, type]),
          returnValue: Future<_i2.Expect<_i2.Comment>>.value(
              _FakeExpect_0<_i2.Comment>())) as _i4
          .Future<_i2.Expect<_i2.Comment>>);
}
