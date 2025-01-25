import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc() : super(AddCardInitial()) {
    on<AddCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
