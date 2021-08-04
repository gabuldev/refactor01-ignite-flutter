import '../shared/models/todo_item.dart';
import 'state_management.dart';

class HomeController extends StateManager<ToDoItem> {
  void onRemoveItem(ToDoItem item) {
    super.state.remove(item);

    super.update(item);
  }

  void onAddItem(ToDoItem item) {
    super.state.add(item);

    super.update(item);
  }

  void onUpdateItem(ToDoItem item) {
    final element = super.state.indexWhere((element) => element == item);
    if (element != -1) {
      super.state[element] = item.copyWith(isDone: !item.isDone);
      super.update(item);
    }
    super.update(item);
  }
}
