import 'dart:async';

class HomeBloc {
  int counter = 0;

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink; //get da entrada de dados
  Stream get output => _streamController.stream; //get da saida de dados

  void incrementCounter() {
    counter++;
    input.add(counter);
  }
}
