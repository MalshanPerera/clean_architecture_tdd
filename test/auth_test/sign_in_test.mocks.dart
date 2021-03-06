// Mocks generated by Mockito 5.0.16 from annotations
// in clean_architecture_tdd/test/auth_test/sign_in_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:clean_architecture_tdd/core/error/failure.dart' as _i5;
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart'
    as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'sign_in_test.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [MockSignInRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockSignInRepo extends _i1.Mock implements _i3.MockSignInRepo {
  MockMockSignInRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserResults>> signIn(
          {String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(#signIn, [], {#email: email, #password: password}),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.UserResults>>.value(
              _FakeEither_0<_i5.Failure, _i6.UserResults>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.UserResults>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserResults>> signUp(
          {String? email,
          String? password,
          String? firstName,
          String? lastName}) =>
      (super.noSuchMethod(
          Invocation.method(#signUp, [], {
            #email: email,
            #password: password,
            #firstName: firstName,
            #lastName: lastName
          }),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.UserResults>>.value(
              _FakeEither_0<_i5.Failure, _i6.UserResults>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.UserResults>>);
}
