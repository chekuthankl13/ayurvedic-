part of 'register_cubit.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial({required List<BranchEntity> branch,required List<TreatmentEntity> treatment}) = Initial;
}
