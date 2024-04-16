import 'package:equatable/equatable.dart';
import 'package:films/src/components/articles_model.dart';
import 'package:hive/hive.dart';

abstract class SaveState extends Equatable {
  const SaveState(/*this.box2, this.box3*/);

  // final Box box2;
  // final Box box3;

  @override
  List<Object?> get props => [];
}

class SaveInitialState extends SaveState{}
class SaveLoadingState extends SaveState{}
class SaveCompletedState extends SaveState{
final List<Articles> articles;
const SaveCompletedState({required this.articles});
}
class SaveFailedState extends SaveState{}