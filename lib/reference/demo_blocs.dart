
// Event
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/reference/demo_repository.dart';

abstract class DataEvent {}

class FetchDataEvent extends DataEvent {}

// State
abstract class DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final TodoModel data;

  DataLoadedState(this.data);
}

// Bloc
class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository}): super(DataLoadingState());

  // Stream<DataState> mapEventToState(DataEvent event) async* {
  //   if (event is FetchDataEvent) {
  //     try {
  //       final data = await dataRepository.getData();
  //       yield DataLoadedState(data);
  //     } catch (_) {
  //       yield ('Error fetching data');
  //     }
  //   }
  // }
}