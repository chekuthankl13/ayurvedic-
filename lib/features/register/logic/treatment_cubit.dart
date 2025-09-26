import 'package:bloc/bloc.dart';

class TreatmentCubit extends Cubit<List<Map<String, String>>> {
  TreatmentCubit():super([]);
  

   void addEntry(Map<String, String> newEntry) {
    emit([...state, newEntry]);
  }

   void removeEntryById(String id) {
    final updatedList = state.where((entry) => entry['id'] != id).toList();
    emit(updatedList);
  }

   void editEntryById(String id, Map<String, String> updatedEntry) {
    final updatedList = state.map((entry) {
      if (entry['id'] == id) {
        return updatedEntry;
      }
      return entry;
    }).toList();

    emit(updatedList);
  }
}