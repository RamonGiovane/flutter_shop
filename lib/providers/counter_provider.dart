

import 'package:flutter/material.dart';

class CounterState {
  int _value;

  void inc() => _value++;
  void dec() => _value--;
  int get value => _value;

  bool diff(CounterState old){
    return old == null || old.value != _value;
  }
}


class CounterProvider extends InheritedWidget {
  
  final CounterState state = CounterState();

  CounterProvider({Widget child}) : super(child: child);

  static CounterProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

}

 

