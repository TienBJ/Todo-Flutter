import 'dart:async';

class CouterBloc {
  int _couter = 0;

  final _couterController = StreamController<int>();

  Stream<int> get couterStream => _couterController.stream;

  get stateController => null;

  get state => null;

  void incrementCouter() {
    _couter ++;
    _couterController.sink.add(_couter);
  }

  void dispose() {
    _couterController.close();
  }
}