import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../components/articles_model.dart';
import '../../components/film_model.dart';
import '../../service/service.dart';
import 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<ServiceDataEvent>(fetchServiceData);
  }

  void fetchServiceData(ServiceDataEvent event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(loading: true));
    try{
    FilmsModel? filmsModel = await ApiService().fetchFilmsData();
    emit(state.copyWith(loading: false, articles: filmsModel?.articles));
    }
        catch(e) {
      print("error $e");
        }
  }
}
