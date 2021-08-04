class StateManager<T> {
  final _state = <T>[];
  final _listeners = <Function>[];

  List<T> get state => _state;

  void setState(T state) {
    _state.add(state);

    update(state);
  }

  void listen(void Function(T state) onUpdate) {
    _listeners.add(onUpdate);
  }

  void update(T state) {
    _listeners.forEach((listener) {
      listener(state);
    });
  }
}
