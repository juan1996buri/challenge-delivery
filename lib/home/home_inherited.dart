import 'package:flutter/material.dart';
import 'package:project_delivery_animation/home/home_bloc.dart';

class HomeInherited extends InheritedWidget {
  const HomeInherited({
    super.key,
    required super.child,
    required this.bloc,
  });
  final HomeBloc bloc;

  static HomeInherited of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeInherited>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
