
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../../../tax_detail/data/model/tax_detail_model.dart';
import '../../../tax_detail/data/model/user_not_found_model.dart';
import '../../domain/entity/tax_residence_detail.dart';

abstract class TaxDetailRemoteDataSource {
  Future<Either<UserNotFoundModel, TexDetailModel>> getTaxDetail(
      String id, String accessToken);
  Future<Either<UserNotFoundModel, void>> saveTaxDetail(
      String id, String accessToken, List<TaxResidence> taxResidencies);
}

class TaxDetailRemoteDataSourceImpl extends TaxDetailRemoteDataSource {
  final http.Client client;

  TaxDetailRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<UserNotFoundModel, TexDetailModel>> getTaxDetail(
      String id, String accessToken) async {
    final response =
        await client.get(Uri.parse(Urls.userTaxDetails(id)), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        });

    if (response.statusCode == 200) {
      return Right(TexDetailModel.fromJson(json.decode(response.body)));
    } else if (response.statusCode == 400) {
      return Left(UserNotFoundModel.fromJson(json.decode(response.body)));
    } else {
      throw ServerException();
    }
  }

  Future<Either<UserNotFoundModel, void>> saveTaxDetail(
      String id, String accessToken, List<TaxResidence> taxResidencies) async {

    final jasonData = convertToJson(taxResidencies);
    print(jasonData);
    var body = json.encode(jasonData);

    final response =
    await client.put(Uri.parse(Urls.userSaveTaxDetails(id)), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }, body: body);

    if (response.statusCode == 200) {
      return Right(());
    } else if (response.statusCode == 400) {
      return Left(UserNotFoundModel.fromJson(json.decode(response.body)));
    } else {
      throw ServerException();
    }
  }

  Map<String, dynamic> convertToJson(List<TaxResidence> taxResidencies) {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    List<Map<String, dynamic>> list = taxResidencies.map((e) => e.toJson()).toList();
    if (list.isNotEmpty) {
      data['primaryTaxResidence'] = taxResidencies[0].toJson();
    }
    if (list.length > 1) {
      list.removeAt(0);
      data['secondaryTaxResidence'] = list;
    }
    return data;
  }
}