

import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/use_cases/sign_in_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'sign_in_test.mocks.dart';

class MockSignInRepo extends Mock implements AuthRepository {}

@GenerateMocks([MockSignInRepo])
void main() {
  late MockMockSignInRepo mockSignInRepo;
  SignInUC? usecase;

  setUp(() {
    mockSignInRepo = MockMockSignInRepo();
    usecase = SignInUC(repository: mockSignInRepo);
  });

  const email = 'vincent@gapstars.net';
  const password = 'adminuser';

  final results = UserModel(
    data: const Data(accessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxOGNlNTAzZjhhYzEzYWYyYzA5ZGY3YyIsInJvbGVzIjpbImFkbWluIl0sImVtYWlsIjoidmluY2VudEBnYXBzdGFycy5uZXQiLCJkaXNwbGF5TmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNjM4NTIxMTIyLCJleHAiOjE2Mzg1MjIwMjJ9.O9XGUU2_6tMspd6MqBBtJx2dg2U5mPzyltK_nDP1WuY',
      refreshToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxOGNlNTAzZjhhYzEzYWYyYzA5ZGY3YyIsInJvbGVzIjpbImFkbWluIl0sImVtYWlsIjoidmluY2VudEBnYXBzdGFycy5uZXQiLCJkaXNwbGF5TmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNjM4NTIxMTIyLCJleHAiOjE2NDExMTMzMjJ9.vY_oZoHmXykCopajmOfOCrDCp49OKzEPGmCh4VQD1vc',
      roles:  [
        'admin'
      ],
      userData: UserData(
        displayName: 'Vincent',
        email: 'vincent@gapstars.net',
        avatar : 'https://global-one-content.s3.eu-central-1.amazonaws.com/default-images/default-avatar.png',
        firstName: 'Vincent',
        lastName: 'kooistra'
      ),
    )
  );

  test('should sign in with correct credentials', () async {
    //arrange
    when(mockSignInRepo.signIn(email : email, password: password)).thenAnswer((_) async => Right(results));
    // act
    final result = await usecase?.call(const SignInParams(email: email, password: password));
    // assert
    expect(result, Right(results));
    verify(mockSignInRepo.signIn(email : email, password: password));
    verifyNoMoreInteractions(mockSignInRepo);
  }
  );
}