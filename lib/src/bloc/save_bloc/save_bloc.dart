import 'package:bloc/bloc.dart';
import 'package:films/src/bloc/save_bloc/save_event.dart';
import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:hive/hive.dart';
import '../../screen/film_card.dart';

class HomeScreenBloc extends Bloc<SaveEvent, SaveState> {
  HomeScreenBloc() : super( SaveInitialState()) {
    on<SaveDataEvent>(saveToHive);
    }

  void saveToHive(SaveEvent event, Emitter<SaveState> emit) async {
    emit(SaveLoadingState());
    try{
    box3 = await Hive.openBox("ImageDescription");
    //box.add(article.description);
    box3.add(article.urlToImage);
    box2 = box3;
    print("BoxValue${box.values}");
    print("BoxKey${box.keys}");
    emit(SaveCompletedState(articles: articles));
    }catch(e){
      emit(SaveFailedState());
    }
   }
  }