import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/reference/demo_service.dart';

class DataRepository {
  final DataService dataService;

  DataRepository({required this.dataService});

  Future<List<TodoModel>> getData() async {
    return await dataService.fetchTodoList();
  }

  Future<void> saveData(String data) async {
    await Future.delayed(const Duration(seconds: 3));
    // Handle Save data
    print('Sava data: $data');
  }

  Future<void> updateData(String data) async {
    await Future.delayed(const Duration(seconds: 4));
    // Handle Update data
    print('Update new: $data');
  }
}