import 'package:equatable/equatable.dart';
import 'package:films/src/components/articles_model.dart';
import 'package:hive/hive.dart';

class SaveState extends Equatable {
  final bool? isLoading;
  final Articles? articles;
  Box? saveBox1;
  Box? saveBox2;
  final bool? updateBox;

  SaveState({
    this.articles,
    this.isLoading,
    this.saveBox1,
    this.saveBox2,
    this.updateBox = false,
  });

  SaveState copyWith({
    bool? isLoading,
    Articles? articles,
    Box? saveBox1,
    Box? saveBox2,
    bool? updateBox,
  }) {
    return SaveState(
      isLoading: isLoading ?? this.isLoading,
      articles: articles ?? this.articles,
      saveBox1: saveBox1 ?? this.saveBox1,
      saveBox2: saveBox2 ?? this.saveBox2,
      updateBox: updateBox ?? this.updateBox,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        articles,
        saveBox1,
        saveBox2,
        updateBox,
      ];
}
