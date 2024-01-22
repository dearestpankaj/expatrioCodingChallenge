
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/tax_residence_detail.dart';

abstract class TaxDetailRepository {
  Future<Either<Failure, List<TaxResidence>?>> getTaxDetail(String id, String accessToken);
  Future<Either<Failure, void>> saveTaxDetail(String id, String accessToken, List<TaxResidence> taxResidencies);
}