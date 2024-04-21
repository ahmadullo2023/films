import 'package:equatable/equatable.dart';
import '../../components/articles_model.dart';

// abstract class SaveEvent extends Equatable {}
//
// class SaveDataEvent extends SaveEvent{
//    final Article article;
//
//    SaveDataEvent({required this.article});
//
//   @override
//   List<Object?> get props => [];
// }



abstract class SaveEvent extends Equatable {}

class SaveDataEvent extends SaveEvent{

  //final Article article1;
  //final String article1;
  final Map<String, String> article1;

  SaveDataEvent({required this.article1});

  @override
  List<Object?> get props => [];
}
