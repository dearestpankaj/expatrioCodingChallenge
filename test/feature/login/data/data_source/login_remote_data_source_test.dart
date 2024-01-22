import 'dart:convert';

import 'package:coding_challenge/core/constants/constants.dart';
import 'package:coding_challenge/feature/login/data/data_source/login_remote_data_source.dart';
import 'package:coding_challenge/feature/login/data/model/login_failed_modal.dart';
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late LoginRemoteDataSourceImpl loginRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    loginRemoteDataSourceImpl = LoginRemoteDataSourceImpl(client: mockHttpClient);
  });
  const username = 'username';
  const password = 'password';
  final loginModel = LoginModel(accessToken: 'access token', userId: 1);

  group('get login model on login success ', ()
  {
    test('should return login model when the response code is 200', () async {
      when(
          mockHttpClient.post(Uri.parse(Urls.autenticateUser), headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
            body: jsonEncode(<String, dynamic>{
              'email': username,
              'password': password,
            }))
      ).thenAnswer(
              (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_login_model.json'),
              200
          )
      );
      //act
      final result = await loginRemoteDataSourceImpl.authenticateUser(username, password);

      //assert
      expect(true, result.isRight());
      result.fold((l) => fail('message'), (r) {
        expect(r, isA<LoginModel>());
      });
    });

    test('should return LoginFailedModal when the response code is 400', () async {
      when(
          mockHttpClient.post(Uri.parse(Urls.autenticateUser), headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
              body: jsonEncode(<String, dynamic>{
                'email': username,
                'password': password,
              }))
      ).thenAnswer(
              (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_login_fail_model.json'),
              400
          )
      );
      //act
      final result = await loginRemoteDataSourceImpl.authenticateUser(username, password);

      //assert
      expect(true, result.isLeft());
      result.fold((l) {
        expect(l, isA<LoginFailedModal>());
      }, (r) {

        fail('message');
      });
    });
  });
}