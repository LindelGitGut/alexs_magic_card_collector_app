import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_collector_event.dart';
part 'card_collector_state.dart';

class CardCollectorBloc extends Bloc<CardCollectorEvent, CardCollectorState> {
  CardCollectorBloc() : super(CardCollectorInitial()) {
    on<CardCollectorEvent>((event, emit) {



    });
  }
}
