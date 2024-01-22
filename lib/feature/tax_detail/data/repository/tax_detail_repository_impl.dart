import 'dart:io';

import 'package:coding_challenge/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entity/tax_residence_detail.dart';
import '../../domain/repository/tax_detail_repository.dart';
import '../data_source/tax_detail_remote_data_source.dart';

class TaxDetailRepositoryImpl extends TaxDetailRepository {
  final TaxDetailRemoteDataSource taxDetailRemoteDataSource;

  TaxDetailRepositoryImpl({required this.taxDetailRemoteDataSource});

  @override
  Future<Either<Failure, List<TaxResidence>?>> getTaxDetail(
      String id, String accessToken) async {
    try {
      final result =
          await taxDetailRemoteDataSource.getTaxDetail(id, accessToken);

      return result.fold((failure) {
        return Left(UserNotFoundFailure(failure.clientMessage!));
      }, (success) {
        List<TaxResidence>? taxResidencies = success.secondaryTaxResidence
            ?.map((e) => TaxResidence(
                country: e.country ?? "", id: e.id ?? "", isPrimary: false))
            .toList();
        taxResidencies?.insert(
            0,
            TaxResidence(
                country: success.primaryTaxResidence?.country ?? "",
                id: success.primaryTaxResidence?.id ?? "",
                isPrimary: true));
        return Right(taxResidencies);
      });
    } on ServerException {
      return const Left(ServerFailure('An error has occured'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connec to internet'));
    }
  }

  @override
  Future<Either<Failure, void>> saveTaxDetail(
      String id, String accessToken, List<TaxResidence> taxResidencies) async {
    try {
      final result = await taxDetailRemoteDataSource.saveTaxDetail(
          id, accessToken, taxResidencies);

      return result.fold((failure) {
        return Left(UserNotFoundFailure(failure.clientMessage!));
      }, (success) {
        return const Right(());
      });
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to internet'));
    }
  }
}
