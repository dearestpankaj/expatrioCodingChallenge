
import 'dart:convert';

import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final loginModel = LoginModel(
    accessToken: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ4cDppZCI6IjExMzg3NSIsInhwOmxhc3ROYW1lIjoiQmEgQ2JhIEFpb24iLCJ4cDpzdWJqZWN0IjoiQm9ib24gQmEgQ2JhIEFpb24iLCJ4cDpwdiI6MiwiaXNzIjoieC1wYXRyaW8iLCJ4cDplbWFpbCI6InRpdG8rYnM3OTJAZXhwYXRyaW8uY29tIiwieHA6cm9sZSI6IkNVU1RPTUVSIiwieHA6Zmlyc3ROYW1lIjoiQm9ib24iLCJleHAiOjE3MDU5MjAwNTYsImlhdCI6MTcwNTkxNjQ1NiwianRpIjoiMTIzIn0.wX-fTmu8p_pA2gPprLtQQEqd2pFH4GjO3umsNllUMExke5Znu_ZALxjOEUWe29kqEkxpqFj-C5kFgMZNJtZBcA',
      accessTokenExpiresAt: '2024-01-22T10:40:56.488250Z',
      userRole: 'CUSTOMER',
      xpm: false,
  userId: 113875,
  subject: Subject(
      userId: 113875,
      userUuid: '7fe524e1-9575-4050-b209-8ebaf7094347',
      lastName: 'Ba Cba Aion',
      firstName: 'Bobon',
      fullName: 'Bobon Ba Cba Aion',
      email: 'tito+bs792@expatrio.com',
      role: 'CUSTOMER',
      isAdmin: false,
      consoleRoles: [],
  ),
      maxAgeSeconds: 3600,
  );

  test(
      'should return a valid model from json',
          () async {

        //arrange
        final Map < String, dynamic > jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_login_model.json'),
        );

        //act
        final result = LoginModel.fromJson(jsonMap);

        //assert
        expect(result, equals(loginModel));

      }
  );

  test(
    'should return a json map containing proper data',
        () async {

      // act
      final result = loginModel.toJson();

      // assert
      final expectedJsonMap = {
        "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ4cDppZCI6IjExMzg3NSIsInhwOmxhc3ROYW1lIjoiQmEgQ2JhIEFpb24iLCJ4cDpzdWJqZWN0IjoiQm9ib24gQmEgQ2JhIEFpb24iLCJ4cDpwdiI6MiwiaXNzIjoieC1wYXRyaW8iLCJ4cDplbWFpbCI6InRpdG8rYnM3OTJAZXhwYXRyaW8uY29tIiwieHA6cm9sZSI6IkNVU1RPTUVSIiwieHA6Zmlyc3ROYW1lIjoiQm9ib24iLCJleHAiOjE3MDU5MjAwNTYsImlhdCI6MTcwNTkxNjQ1NiwianRpIjoiMTIzIn0.wX-fTmu8p_pA2gPprLtQQEqd2pFH4GjO3umsNllUMExke5Znu_ZALxjOEUWe29kqEkxpqFj-C5kFgMZNJtZBcA",
        "accessTokenExpiresAt": "2024-01-22T10:40:56.488250Z",
        "userRole": "CUSTOMER",
        "xpm": false,
        "userId": 113875,
        "subject": {
          "userId": 113875,
          "userUuid": "7fe524e1-9575-4050-b209-8ebaf7094347",
          "lastName": "Ba Cba Aion",
          "firstName": "Bobon",
          "fullName": "Bobon Ba Cba Aion",
          "email": "tito+bs792@expatrio.com",
          "role": "CUSTOMER",
          "isAdmin": false,
          "consoleRoles": []
        },
        "maxAgeSeconds": 3600
      };

      expect(result, equals(expectedJsonMap));

    },
  );
}