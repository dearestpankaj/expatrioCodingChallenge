import 'package:bloc/bloc.dart';
import 'package:coding_challenge/feature/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUsecase;

  LoginBloc(this._loginUsecase) : super(LoginInitial()) {
    on<OnLoginRequested>((event, emit) async {
      emit(LoginLoading());
      if (event.username.isNotEmpty && event.password.isNotEmpty) {
        final result =
            await _loginUsecase.execute(event.username, event.password);
        result.fold((failure) => emit(LoginFailure(message: failure.message)),
            (success) => emit(LoginSuccess()));
      } else {
        emit(LoginFailure(message: 'Please enter username and password'));
      }
    });
  }
}
