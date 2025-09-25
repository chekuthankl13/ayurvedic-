import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/register/data/model/register_param_model.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_branch_usecase.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_treatment_usecase.dart';
import 'package:ayurvedic/features/register/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final LoadBranchUsecase loadBranchUsecase;
  final LoadTreatmentUsecase loadTreatmentUsecase;
  final RegisterUsecase registerUsecase;
  RegisterCubit(
    this.loadBranchUsecase,
    this.loadTreatmentUsecase,
    this.registerUsecase,
  ) : super(RegisterState.initial(branch: [], treatment: []));

  Future<Map<String, dynamic>> loadBranch() async {
    try {
      var res = await loadBranchUsecase(NoParam());
      return res.fold(
        (l) => {"status": "!ok", "error": l.error},
        (r) => {"status": "ok", "data": r},
      );
    } catch (e) {
      return {"status": "!ok", "error": e.toString()};
    }
  }

  Future<Map<String, dynamic>> loadTreatment() async {
    try {
      var res = await loadTreatmentUsecase(NoParam());
      return res.fold(
        (l) => {"status": "!ok", "error": l.error},
        (r) => {"status": "ok", "data": r},
      );
    } catch (e) {
      return {"status": "!ok", "error": e.toString()};
    }
  }

  register({
    required name,
    exceutive,
    payment,
    phone,
    address,
    totalAmount,
    discountAmount,
    advanceAmount,
    dateEndTime,
    male,
    balanceAmount,
    female,
    branch,
    treatments,
  }) async {
    try {
      emit(RegisterState.loading());
      var res = await registerUsecase(
        RegisterParamModel(
          name: name,
          exceutive: exceutive,
          payment: payment,
          phone: phone,
          address: address,
          totalAmount: totalAmount,
          discountAmount: discountAmount,
          advanceAmount: advanceAmount,
          dateEndTime: dateEndTime,
          id: "",
          male: male,
          balanceAmount: balanceAmount,
          female: female,
          branch: branch,
          treatments: treatments,
        ),
      );

      res.fold(
        (l) => emit(RegisterState.error(error: l.error)),
        (r) => emit(RegisterState.registered()),
      );
    } catch (e) {
      emit(RegisterState.error(error: e.toString()));
    }
  }
}
