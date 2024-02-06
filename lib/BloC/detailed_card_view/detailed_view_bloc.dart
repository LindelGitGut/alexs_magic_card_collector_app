import 'dart:async';

import 'package:alexs_magic_card_collector_app/data/cardmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detailed_view_event.dart';
part 'detailed_view_state.dart';

class DetailedViewBloc extends Bloc<DetailedViewEvent, DetailedViewState> {
  DetailedViewBloc() : super(DetailedViewInitial()) {
    on<DetailedViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
