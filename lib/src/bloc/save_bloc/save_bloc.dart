import 'package:bloc/bloc.dart';
import 'package:films/src/bloc/save_bloc/save_event.dart';
import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:hive/hive.dart';
import '../../components/articles_model.dart';


// class SaveBloc extends Bloc<SaveEvent, SaveState> {
//   SaveBloc() : super(SaveInitialState()) {
//     on<SaveDataEvent>(saveToHive);
//   }
//
//   void saveToHive(SaveDataEvent event, Emitter<SaveState> emit) async {
//     emit(SaveLoadingState());
//     try {
//       var box = await Hive.openBox<Article>("ImageDescription");
//       box.add(event.article);
//
//       print("BOOOOOOOOOOOX VALUE${box.values}");
//
//       emit(SaveCompletedState(article: box.values.toList()));
//     } catch (e) {
//       emit(SaveFailedState());
//     }
//   }
// }


class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(const SaveState()) {
    on<SaveDataEvent>(saveToHive);
  }
  void saveToHive(SaveDataEvent event, Emitter<SaveState> emit) async {
    emit(state.copyWith(loading: true));
    try{

      var box = await Hive.openBox<String>("ImageDescription");

      box.add(event.article1);

      print("BOOOOOOOOOOOOOOOX${box.values.toList()}");

      emit(state.copyWith(loading: false, article1: box.values.toList()));
    }
    catch(e) {
      print("error $e");
    }
  }
}