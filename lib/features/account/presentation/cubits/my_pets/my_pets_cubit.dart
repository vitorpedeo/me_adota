import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_pets_state.dart';

class MyPetsCubit extends Cubit<MyPetsState> {
  MyPetsCubit() : super(MyPetsInitial());

  void loadPets() {
    final List<int> pets = [1];

    emit(MyPetsLoaded(pets));
  }
}
