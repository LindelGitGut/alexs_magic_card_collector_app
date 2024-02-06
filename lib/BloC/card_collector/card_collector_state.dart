part of 'card_collector_bloc.dart';

abstract class CardCollectorState extends Equatable {

  const CardCollectorState();
}

class CardCollectorInitialState extends CardCollectorState {

  String page;
  List<MagicCardModel> results;

  CardCollectorInitialState({
    this.results = const [],
    this.page = "All Cards"
  });

  @override
  List<Object> get props => [results];
}

class CardCollectorLoadingState extends CardCollectorState{
  String page;
  List<MagicCardModel> results;
  CardCollectorLoadingState({required this.page, required this.results});
  @override
  // TODO: implement props
  List<Object?> get props => [page, results];
}

class CardCollectorLoadedState extends CardCollectorState{
  String page;
  List<MagicCardModel> results;
  CardCollectorLoadedState ({required this.page,required this.results});
  @override
  // TODO: implement props
  List<Object?> get props => [page,results];
}
