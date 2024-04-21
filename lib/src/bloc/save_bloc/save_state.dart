import 'package:equatable/equatable.dart';
import '../../components/articles_model.dart';
// import '../../components/articles_model.dart';

// abstract class SaveState extends Equatable {
//   const SaveState(/*this.box2, this.box3*/);
//
//   // final Box box2;
//   // final Box box3;
//
//   @override
//   List<Object?> get props => [article];
// }
//
// class SaveInitialState extends SaveState{}
// class SaveLoadingState extends SaveState{}
// class SaveCompletedState extends SaveState{
// final List<Article> article;
// const SaveCompletedState({required this.article});
// }
// class SaveFailedState extends SaveState{}



class SaveState extends Equatable {
  const SaveState({ this.article1 , this.loading});

  final List<Map<String, String>>? article1;
  final bool? loading;

  @override
  List<Object?> get props => [article1, loading];

  SaveState copyWith({
    List<Map<String, String>>? article1,

    bool? loading,
  }) {
    return SaveState(
      article1: article1 ?? this.article1,
      loading: loading ?? this.loading,
    );
  }
}






