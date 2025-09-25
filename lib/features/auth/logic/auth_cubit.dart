import 'package:ayurvedic/features/auth/data/model/auth_param_model.dart';
import 'package:ayurvedic/features/auth/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  AuthCubit(this.loginUsecase) : super(AuthState.initial());

   login({mobile, password}) async {
    try {
      emit(AuthState.loading());
      var res = await loginUsecase(
        AuthParamModel(username: mobile, password: password),
      );
      res.fold(
        (l) => emit(AuthState.error(error: l.error)),
        (r) => emit(AuthState.success()),
      );
    } catch (e) {
      emit(AuthState.error(error: e.toString()));
    }
  }
}
