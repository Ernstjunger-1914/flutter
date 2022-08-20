import 'package:mobx/mobx.dart';

// 아래의 명령어를 통해 counter.g.dart 파일 생성
// flutter packages pub run build_runner build
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

// store class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}