import 'package:flutter_bloc/flutter_bloc.dart';

class SexCubit extends Cubit<SexState> {
  SexCubit() : super(SexState(female: 0, male: 0));

  reset() => emit(SexState(male: 0, female: 0));

  void incrementMale() {
    emit(SexState(male: state.male + 1, female: state.female));
  }

  void decrementMale() {
    emit(
      SexState(male: state.male > 0 ? state.male - 1 : 0, female: state.female),
    );
  }

  void incrementFemale() {
    emit(SexState(male: state.male, female: state.female + 1));
  }

  void decrementFemale() {
    emit(
      SexState(
        male: state.male,
        female: state.female > 0 ? state.female - 1 : 0,
      ),
    );
  }
}

class SexState {
  final int male;
  final int female;

  SexState({required this.male, required this.female});
}
