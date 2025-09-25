part of 'register_cubit.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const RegisterState._();
  const factory RegisterState.initial({required List<BranchEntity> branch,required List<TreatmentEntity> treatment}) = Initial;

 const factory RegisterState.loading()= Loading;
 const factory RegisterState.error({required String error})= Error;
 const factory RegisterState.registered()= Registered;

}
