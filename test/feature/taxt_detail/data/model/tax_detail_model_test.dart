
import 'dart:convert';

import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/tax_detail/data/model/tax_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final taxDetailModel = TexDetailModel(
      usPerson: false,
      usTaxId: '',
      primaryTaxResidence: PrimaryTaxResidence(country: 'AF', id: '12345'),
      secondaryTaxResidence: [
        PrimaryTaxResidence(country: 'FR', id: '1523')
      ],
  w9FileId: 320459,
  w9File: W9File(id: 320459,
      createdAt: "2023-12-14T13:12:24.371608",
      modifiedAt: "2023-12-14T13:12:24.435052",
      fileName: "FORM_W9_03c91726-b202-4ff7-bead-ea6fc0687b56.pdf",
      dataType: "FORM_W9",
      author: null,
      state: null,
      field: null,
      label: null,
      description: null,
      fileUrl: "https://dev-files.expatrio.com/FORM_W9_03c91726-b202-4ff7-bead-ea6fc0687b56.pdf?response-content-type=application/pdf&response-content-disposition=inline%3B+filename%3DFORM_W9_03c91726-b202-4ff7-bead-ea6fc0687b56.pdf&Expires=1705933673&Signature=DO5XjrbJakH2XhyTTrdOIAkBlv8POj3Dhiz1HFmCjoH40227J0Sj4NMCcw1FmtOROmT10NU4TU4nYUZxlcBCtFM~weaWzy9yaHzkPggFqAWgm3H03IoBHbr5e7b0dykH8JRT046LXyvW~ZTjL5F65YIWdaErvQsBx8h4bYgHWI~Qu-fG1qa5lKMB2hn-SsjFRKqKibJu1HkcYiqaX-h1YyiY1TMlXJZl4XX0HGuelO0oVyqtoMKlOvEEGkwYNnAAdEYENginXeOBQXnI1AQPmddqU92aWbdPO9wSNlLUFA-QL6~AX4QmeDHbXAc1~lAhm574wr8Cag0L~WaOZJUvnQ__&Key-Pair-Id=APKAJU3M3ZIAQ775OZBQ",
      invalid: false)
  );


  test(
      'should return a valid model from json',
          () async {

        //arrange
        final Map < String, dynamic > jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_tax_detail_model.json'),
        );

        //act
        final result = TexDetailModel.fromJson(jsonMap);

        //assert
        expect(result, equals(taxDetailModel));

      }
  );
}