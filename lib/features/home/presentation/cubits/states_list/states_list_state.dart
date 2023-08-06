part of 'states_list_cubit.dart';

abstract class StatesListState extends Equatable {}

class StatesListInitial extends StatesListState {
  @override
  List<Object> get props => [];
}

class StatesListLoading extends StatesListState {
  @override
  List<Object> get props => [];
}

class StatesListLoaded extends StatesListState {
  final List<StateEntity> states;

  StatesListLoaded(this.states);

  @override
  List<Object> get props => [states];
}

class StatesListError extends StatesListState {
  final String message;

  StatesListError(this.message);

  @override
  List<Object> get props => [message];
}
