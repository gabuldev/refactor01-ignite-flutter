import 'package:flutter/material.dart';

import 'screens/done_screen.dart';
import 'screens/home_controller.dart';
import 'screens/task_screen.dart';
import 'shared/builder_widget.dart';
import 'shared/models/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var _selectedIndex = 0;

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuilderWidget<ToDoItem>(
          controller: _controller,
          builder: (context, state) {
            return PageView(
              controller: _pageViewController,
              children: <Widget>[
                TaskScreen(
                  itemList: state
                      .where((element) => element.isDone == false)
                      .toList(),
                  onAddItem: (item) {
                    _controller.onAddItem(ToDoItem(title: item));
                  },
                  onCompleteItem: _controller.onUpdateItem,
                  onRemoveItem: _controller.onRemoveItem,
                ),
                DoneScreen(
                  itemList:
                      state.where((element) => element.isDone == true).toList(),
                  onRemoveItem: _controller.onRemoveItem,
                  onResetItem: _controller.onUpdateItem,
                )
              ],
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          _pageViewController.animateToPage(
            _selectedIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
