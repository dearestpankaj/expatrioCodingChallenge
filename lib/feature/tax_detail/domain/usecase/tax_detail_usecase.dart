import 'package:coding_challenge/feature/tax_detail/domain/repository/tax_detail_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../login/domain/repository/user_auth_repository.dart';
import '../entity/tax_residence_detail.dart';

class TaxDetailUseCase {
  TaxDetailRepository taxDetailRepository;
  UserAuthRepository userAuthRepository;

  TaxDetailUseCase(
      {required this.taxDetailRepository, required this.userAuthRepository});

  Future<Either<Failure, List<TaxResidence>?>> getTaxDetail() async {
    final accessToken = await userAuthRepository.getAuthenticationToken() ?? '';
    final userId = await userAuthRepository.getUserId() ?? '';
    if (accessToken.isNotEmpty && userId.isNotEmpty) {
      return taxDetailRepository.getTaxDetail(userId, accessToken);
    } else {
      return const Left(TokenExpiredFailure('Token Expired'));
    }
  }

  Future<Either<Failure, void>> saveTaxDetail(List<TaxResidence> taxResidencies) async {
    final accessToken = await userAuthRepository.getAuthenticationToken() ?? '';
    final userId = await userAuthRepository.getUserId() ?? '';
    if (accessToken.isNotEmpty && userId.isNotEmpty) {
      return taxDetailRepository.saveTaxDetail(userId, accessToken, taxResidencies);
    } else {
      return const Left(TokenExpiredFailure('Token Expired'));
    }
  }
}
