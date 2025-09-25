import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_branch_usecase.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_treatment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final LoadBranchUsecase loadBranchUsecase;
  final LoadTreatmentUsecase loadTreatmentUsecase;
  RegisterCubit(this.loadBranchUsecase, this.loadTreatmentUsecase) : super(RegisterState.initial(branch: [], treatment: []));

  Future<Map<String,dynamic>> loadBranch()async{
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
}
