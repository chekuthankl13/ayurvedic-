import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:ayurvedic/features/home/domain/usecase/load_patient_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final LoadPatientUsecase loadPatientUsecase;
  HomeCubit(this.loadPatientUsecase) : super(HomeState.initial());

  loadPatient() async {
    try {
      emit(HomeState.loading());
      var res = await loadPatientUsecase(NoParam());
      res.fold(
        (l) => emit(HomeState.error(error: l.error)),
        (r) => emit(HomeState.patientLoaded(patients: r)),
      );
    } catch (e) {
      emit(HomeState.error(error: e.toString()));
    }
  }
}
