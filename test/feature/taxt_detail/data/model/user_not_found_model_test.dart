
import 'dart:convert';

import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/tax_detail/data/model/user_not_found_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final userNotFoundModel = UserNotFoundModel(message: 'Invalid authentication token.', clientMessage: 'Invalid authentication token. Try to logout and login again.', errorCode: 'INVALID_AUTH_TOKEN', data: null);

  test(
      'should return a valid model from json',
          () async {

        //arrange
        final Map < String, dynamic > jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_user_not_found_model.json'),
        );

        //act
        final result = UserNotFoundModel.fromJson(jsonMap);

        //assert
        expect(result, equals(userNotFoundModel));

      }
  );

  test(
    'should return a json map containing proper data',
        () async {

      // act
      final result = userNotFoundModel.toJson();

      // assert
      final expectedJsonMap = {
        "message": "Invalid authentication token.",
        "clientMessage": "Invalid authentication token. Try to logout and login again.",
        "errorCode": "INVALID_AUTH_TOKEN",
        "data": null
      };

      expect(result, equals(expectedJsonMap));

    },
  );
}