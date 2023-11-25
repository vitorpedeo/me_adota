part of 'my_pets_cubit.dart';

abstract class MyPetsState extends Equatable {}

class MyPetsInitial extends MyPetsState {
  @override
  List<Object> get props => [];
}

class MyPetsLoaded extends MyPetsState {
  final List<int> pets;

  MyPetsLoaded(this.pets);

  @override
  List<Object> get props => [pets];
}
