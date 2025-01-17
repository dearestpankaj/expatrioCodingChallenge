// Mocks generated by Mockito 5.4.4 from annotations
// in coding_challenge/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i19;
import 'dart:typed_data' as _i21;

import 'package:coding_challenge/core/error/failure.dart' as _i12;
import 'package:coding_challenge/feature/login/data/data_source/login_remote_data_source.dart'
    as _i9;
import 'package:coding_challenge/feature/login/data/data_source/user_auth_local_data_source.dart'
    as _i7;
import 'package:coding_challenge/feature/login/data/model/login_failed_modal.dart'
    as _i10;
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart'
    as _i11;
import 'package:coding_challenge/feature/login/domain/repository/login_repository.dart'
    as _i3;
import 'package:coding_challenge/feature/login/domain/repository/user_auth_repository.dart'
    as _i4;
import 'package:coding_challenge/feature/login/domain/usecases/login_usecase.dart'
    as _i13;
import 'package:coding_challenge/feature/tax_detail/data/data_source/tax_detail_remote_data_source.dart'
    as _i14;
import 'package:coding_challenge/feature/tax_detail/data/model/tax_detail_model.dart'
    as _i16;
import 'package:coding_challenge/feature/tax_detail/data/model/user_not_found_model.dart'
    as _i15;
import 'package:coding_challenge/feature/tax_detail/domain/entity/tax_residence_detail.dart'
    as _i17;
import 'package:coding_challenge/feature/tax_detail/domain/repository/tax_detail_repository.dart'
    as _i5;
import 'package:coding_challenge/feature/tax_detail/domain/usecase/tax_detail_usecase.dart'
    as _i18;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i20;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginRepository_1 extends _i1.SmartFake
    implements _i3.LoginRepository {
  _FakeLoginRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserAuthRepository_2 extends _i1.SmartFake
    implements _i4.UserAuthRepository {
  _FakeUserAuthRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTaxDetailRepository_3 extends _i1.SmartFake
    implements _i5.TaxDetailRepository {
  _FakeTaxDetailRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserAuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAuthLocalDataSource extends _i1.Mock
    implements _i7.UserAuthLocalDataSource {
  MockUserAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String?> getAuthenticationToken() => (super.noSuchMethod(
        Invocation.method(
          #getAuthenticationToken,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  dynamic saveAuthenticationToken(String? authToken) =>
      super.noSuchMethod(Invocation.method(
        #saveAuthenticationToken,
        [authToken],
      ));

  @override
  dynamic saveUserId(String? userId) => super.noSuchMethod(Invocation.method(
        #saveUserId,
        [userId],
      ));

  @override
  _i8.Future<String?> getUserId() => (super.noSuchMethod(
        Invocation.method(
          #getUserId,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
}

/// A class which mocks [LoginRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRemoteDataSource extends _i1.Mock
    implements _i9.LoginRemoteDataSource {
  MockLoginRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i10.LoginFailedModal, _i11.LoginModel>>
      authenticateUser(
    String? username,
    String? password,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #authenticateUser,
              [
                username,
                password,
              ],
            ),
            returnValue: _i8.Future<
                    _i2.Either<_i10.LoginFailedModal, _i11.LoginModel>>.value(
                _FakeEither_0<_i10.LoginFailedModal, _i11.LoginModel>(
              this,
              Invocation.method(
                #authenticateUser,
                [
                  username,
                  password,
                ],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i10.LoginFailedModal, _i11.LoginModel>>);
}

/// A class which mocks [UserAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAuthRepository extends _i1.Mock
    implements _i4.UserAuthRepository {
  MockUserAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  dynamic saveAuthenticationToken(String? authToken) =>
      super.noSuchMethod(Invocation.method(
        #saveAuthenticationToken,
        [authToken],
      ));

  @override
  _i8.Future<String?> getAuthenticationToken() => (super.noSuchMethod(
        Invocation.method(
          #getAuthenticationToken,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  dynamic saveUserID(String? userId) => super.noSuchMethod(Invocation.method(
        #saveUserID,
        [userId],
      ));

  @override
  _i8.Future<String?> getUserId() => (super.noSuchMethod(
        Invocation.method(
          #getUserId,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
}

/// A class which mocks [LoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepository extends _i1.Mock implements _i3.LoginRepository {
  MockLoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i12.Failure, _i11.LoginModel>> authenticateUser(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #authenticateUser,
          [
            username,
            password,
          ],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i12.Failure, _i11.LoginModel>>.value(
                _FakeEither_0<_i12.Failure, _i11.LoginModel>(
          this,
          Invocation.method(
            #authenticateUser,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, _i11.LoginModel>>);
}

/// A class which mocks [LoginUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUseCase extends _i1.Mock implements _i13.LoginUseCase {
  MockLoginUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.LoginRepository get loginRepository => (super.noSuchMethod(
        Invocation.getter(#loginRepository),
        returnValue: _FakeLoginRepository_1(
          this,
          Invocation.getter(#loginRepository),
        ),
      ) as _i3.LoginRepository);

  @override
  _i4.UserAuthRepository get userAuthRepository => (super.noSuchMethod(
        Invocation.getter(#userAuthRepository),
        returnValue: _FakeUserAuthRepository_2(
          this,
          Invocation.getter(#userAuthRepository),
        ),
      ) as _i4.UserAuthRepository);

  @override
  _i8.Future<_i2.Either<_i12.Failure, bool>> execute(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            username,
            password,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i12.Failure, bool>>.value(
            _FakeEither_0<_i12.Failure, bool>(
          this,
          Invocation.method(
            #execute,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, bool>>);
}

/// A class which mocks [TaxDetailRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaxDetailRemoteDataSource extends _i1.Mock
    implements _i14.TaxDetailRemoteDataSource {
  MockTaxDetailRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<
      _i2.Either<_i15.UserNotFoundModel, _i16.TexDetailModel>> getTaxDetail(
    String? id,
    String? accessToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaxDetail,
          [
            id,
            accessToken,
          ],
        ),
        returnValue: _i8.Future<
                _i2.Either<_i15.UserNotFoundModel, _i16.TexDetailModel>>.value(
            _FakeEither_0<_i15.UserNotFoundModel, _i16.TexDetailModel>(
          this,
          Invocation.method(
            #getTaxDetail,
            [
              id,
              accessToken,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i15.UserNotFoundModel, _i16.TexDetailModel>>);

  @override
  _i8.Future<_i2.Either<_i15.UserNotFoundModel, void>> saveTaxDetail(
    String? id,
    String? accessToken,
    List<_i17.TaxResidence>? taxResidencies,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTaxDetail,
          [
            id,
            accessToken,
            taxResidencies,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i15.UserNotFoundModel, void>>.value(
            _FakeEither_0<_i15.UserNotFoundModel, void>(
          this,
          Invocation.method(
            #saveTaxDetail,
            [
              id,
              accessToken,
              taxResidencies,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i15.UserNotFoundModel, void>>);
}

/// A class which mocks [TaxDetailRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaxDetailRepository extends _i1.Mock
    implements _i5.TaxDetailRepository {
  MockTaxDetailRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i17.TaxResidence>?>> getTaxDetail(
    String? id,
    String? accessToken,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaxDetail,
          [
            id,
            accessToken,
          ],
        ),
        returnValue: _i8
            .Future<_i2.Either<_i12.Failure, List<_i17.TaxResidence>?>>.value(
            _FakeEither_0<_i12.Failure, List<_i17.TaxResidence>?>(
          this,
          Invocation.method(
            #getTaxDetail,
            [
              id,
              accessToken,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, List<_i17.TaxResidence>?>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, void>> saveTaxDetail(
    String? id,
    String? accessToken,
    List<_i17.TaxResidence>? taxResidencies,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTaxDetail,
          [
            id,
            accessToken,
            taxResidencies,
          ],
        ),
        returnValue: _i8.Future<_i2.Either<_i12.Failure, void>>.value(
            _FakeEither_0<_i12.Failure, void>(
          this,
          Invocation.method(
            #saveTaxDetail,
            [
              id,
              accessToken,
              taxResidencies,
            ],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, void>>);
}

/// A class which mocks [TaxDetailUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaxDetailUseCase extends _i1.Mock implements _i18.TaxDetailUseCase {
  MockTaxDetailUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TaxDetailRepository get taxDetailRepository => (super.noSuchMethod(
        Invocation.getter(#taxDetailRepository),
        returnValue: _FakeTaxDetailRepository_3(
          this,
          Invocation.getter(#taxDetailRepository),
        ),
      ) as _i5.TaxDetailRepository);

  @override
  set taxDetailRepository(_i5.TaxDetailRepository? _taxDetailRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #taxDetailRepository,
          _taxDetailRepository,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.UserAuthRepository get userAuthRepository => (super.noSuchMethod(
        Invocation.getter(#userAuthRepository),
        returnValue: _FakeUserAuthRepository_2(
          this,
          Invocation.getter(#userAuthRepository),
        ),
      ) as _i4.UserAuthRepository);

  @override
  set userAuthRepository(_i4.UserAuthRepository? _userAuthRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #userAuthRepository,
          _userAuthRepository,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i17.TaxResidence>?>>
      getTaxDetail() => (super.noSuchMethod(
            Invocation.method(
              #getTaxDetail,
              [],
            ),
            returnValue: _i8.Future<
                    _i2.Either<_i12.Failure, List<_i17.TaxResidence>?>>.value(
                _FakeEither_0<_i12.Failure, List<_i17.TaxResidence>?>(
              this,
              Invocation.method(
                #getTaxDetail,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i17.TaxResidence>?>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, void>> saveTaxDetail(
          List<_i17.TaxResidence>? taxResidencies) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTaxDetail,
          [taxResidencies],
        ),
        returnValue: _i8.Future<_i2.Either<_i12.Failure, void>>.value(
            _FakeEither_0<_i12.Failure, void>(
          this,
          Invocation.method(
            #saveTaxDetail,
            [taxResidencies],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, void>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i6.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i19.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i20.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i21.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i21.Uint8List>.value(_i21.Uint8List(0)),
      ) as _i8.Future<_i21.Uint8List>);

  @override
  _i8.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i6.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
