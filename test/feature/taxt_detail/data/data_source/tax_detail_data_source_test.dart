
import 'package:coding_challenge/core/constants/constants.dart';
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/tax_detail/data/data_source/tax_detail_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late TaxDetailRemoteDataSourceImpl taxDetailRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    taxDetailRemoteDataSourceImpl =
        TaxDetailRemoteDataSourceImpl(client: mockHttpClient);
  });

  final loginModel = LoginModel(accessToken: 'access_token', userId: 1);

  group('', () {
    test('should return login model when the response code is 200', () async {

      when(
          mockHttpClient.get(Uri.parse(Urls.userTaxDetails('1')), headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $loginModel.accessToken',
          },)
      ).thenAnswer(
              (_) async => http.Response(
              readJson('helpers/dummy_data/tax_detail_model.json'),
              200
          )
      );
      //act
      final result = await taxDetailRemoteDataSourceImpl.getTaxDetail('1', loginModel.accessToken ?? '');
      expect(true, result.isRight());
      // result.fold((l) => fail('message'), (r) {
      //   expect(r, isA<TexDetailModel>());
      // });

    });
  });
}