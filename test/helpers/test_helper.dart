import 'package:coding_challenge/feature/login/data/data_source/login_remote_data_source.dart';
import 'package:coding_challenge/feature/login/data/data_source/user_auth_local_data_source.dart';
import 'package:coding_challenge/feature/login/domain/repository/login_repository.dart';
import 'package:coding_challenge/feature/login/domain/repository/user_auth_repository.dart';
import 'package:coding_challenge/feature/login/domain/usecases/login_usecase.dart';
import 'package:coding_challenge/feature/tax_detail/data/data_source/tax_detail_remote_data_source.dart';
import 'package:coding_challenge/feature/tax_detail/domain/repository/tax_detail_repository.dart';
import 'package:coding_challenge/feature/tax_detail/domain/usecase/tax_detail_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  UserAuthLocalDataSource,
  LoginRemoteDataSource,
  UserAuthRepository,
  LoginRepository,
  LoginUseCase,
  TaxDetailRemoteDataSource,
  TaxDetailRepository,
  TaxDetailUseCase
],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() { }