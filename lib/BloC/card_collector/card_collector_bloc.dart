import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/cardmodel.dart';

part 'card_collector_event.dart';
part 'card_collector_state.dart';

class CardCollectorBloc extends Bloc<CardCollectorEvent, CardCollectorState> {
  CardCollectorBloc() : super(CardCollectorInitialState()) {
    on<CardCollectorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
