import 'package:flutter_bloc/flutter_bloc.dart';

class IntCubit extends Cubit<int> {
  IntCubit() : super(0);

  update(val) => emit(val);
}

class IntCubit2 extends Cubit<int?> {
  IntCubit2() : super(null);

  update(val) => emit(val);
}
