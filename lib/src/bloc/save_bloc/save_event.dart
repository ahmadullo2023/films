import 'package:equatable/equatable.dart';
import 'package:films/src/components/articles_model.dart';

abstract class SaveEvent extends Equatable {}

class SaveDataEvent extends SaveEvent {
  final Articles articles;

  SaveDataEvent({required this.articles});

  @override
  List<Object?> get props => [articles];
}
