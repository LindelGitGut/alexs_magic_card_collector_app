part of 'detailed_view_bloc.dart';

abstract class DetailedViewState extends Equatable {
  const DetailedViewState();
}

class DetailedViewInitial extends DetailedViewState {
  @override
  List<Object> get props => [];
}

class DetailedViewLoading extends DetailedViewState {


  int currentviewindex;
  MagicCardModel showingmagiccard;
  List<MagicCardModel> navigationelements;

  DetailedViewLoading({required this.showingmagiccard,
    this.navigationelements = const [],
  required this.currentviewindex});

  @override
  List<Object> get props => [showingmagiccard, currentviewindex, navigationelements];
}

class DetailedViewLoaded extends DetailedViewState {

  int currentviewindex;
  MagicCardModel showingmagiccard;
  MagicCardModel showingmagiccard;
  List<MagicCardModel> navigationelements;

  DetailedViewLoaded({required this.showingmagiccard,
    required this.navigationelements,
    required this.currentviewindex});

  @override
  List<Object> get props => [showingmagiccard, currentviewindex, showingmagiccard];
}