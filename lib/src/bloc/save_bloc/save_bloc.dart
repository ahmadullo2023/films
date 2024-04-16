import 'package:bloc/bloc.dart';
import 'package:films/src/bloc/save_bloc/save_event.dart';
import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:hive/hive.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(SaveState()) {
    on<SaveDataEvent>(saveToHive);
  }

  void saveToHive(
    SaveDataEvent event,
    Emitter<SaveState> emit,
  ) async {
    Box saveBox1 = await Hive.openBox("imageDescription");

    saveBox1.add(event.articles.urlToImage);

    emit(
      state.copyWith(
        saveBox2: saveBox1,
        updateBox: !state.updateBox!,
      ),
    );
  }
}
