import 'package:equatable/equatable.dart';

abstract class SaveEvent extends Equatable {}

class SaveDataEvent extends SaveEvent{
  @override
  List<Object?> get props => [];
}

class SaveDateEvent extends SaveEvent{

  // final int incrementNumber;
  // IncrementEvent({required this.incrementNumber});

  @override
  List<Object?> get props => [];
}






