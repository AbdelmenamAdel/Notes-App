import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());
}
