import 'dart:async';

import 'package:rxdart/rxdart.dart';

class MyHomeBloc {
  final _counterStream = BehaviorSubject<int>(seedValue: 0);
  Stream<int> get counterStream => _counterStream.stream;

  final _incrementCounter = StreamController<int>();
  Function(int) get incrementCounter => _incrementCounter.sink.add;

  final _decrementCounter = StreamController<int>();
  Function(int) get decrementCounter => _decrementCounter.sink.add;

  MyHomeBloc() {
    _incrementCounter.stream.listen((value) {
      var sum = _counterStream.value + value;
      _counterStream.add(sum);
    });

    _decrementCounter.stream.listen((value) {
      var min = _counterStream.value - value;
      _counterStream.add(min);
    });
  }

  dispose() {
    _counterStream.close();
    _incrementCounter.close();
    _decrementCounter.close();
  }

  //Bellow there are just some Dart code sample, it is not used in this Flutter sample

  _listSample() {
    List<String> minhaLista;
    minhaLista.where((value) => value.isEmpty);

    minhaLista.forEach((item) => print('${minhaLista.indexOf(item)}: $item'));
  }

  _nullSafe() {
    List<String> minhaLista = null;
    var a = minhaLista?.first;
  }

  _rxSamplesCombine() {
    Observable.combineLatest2(_counterStream, _counterStream, (a, b) {});
  }

  _functionParameter(Function() a) {
    if (true) {
      a();
    }
  }

  _callFunctionWithParameter() {
    _functionParameter(() {
      var a = "its true";
    });
  }

  _builder() {
    var a = OkClass()
      ..prop1 = "1"
      ..prop2 = "2"
      ..prop3 = "3"
      ..okFunction();
  }

  _map() {
    var map = {'prop1': 'value', 'prop2': 'value', 'prop3': 'value'};
  }

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for (var value in stream) {
      sum += value;
    }
    return sum;
  }

  _optionalParameter({String opa = ""}) {}

  _optionalParameterCall() {
    _optionalParameter();
    _optionalParameter(opa: "opaaa");
  }

  _stringInterpolation() {
    var a = "Opaaa";
    var b = "Minha string $a";
    a = "Minha string ${a.trim()}";
  }
}

class OkClass {
  String prop1;
  String prop2;
  String prop3;

  okFunction() {}
}

class OkClass2 {
  String prop1;
  String prop2;

  OkClass2(this.prop1, this.prop2);
}
