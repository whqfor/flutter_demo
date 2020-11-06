/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 11/4/20
 * Time: 2:18 PM
 * target: example集合
 */

import 'package:flutter/widgets.dart';
import 'package:flutter_demo/animation/skeleton.dart';


ExamplesConfiguration getAnimationExamplesConfiguration() {
  final configuration = ExamplesConfiguration();

  configuration.add(ExampleItem(
      name: "Skeleton", builder: (context) => SkeletonDemo()));

  return configuration;
}

ExamplesConfiguration getCodeExamplesConfiguration() {
  final configuration = ExamplesConfiguration();

  // configuration.add(ExampleItem(
  //     name: "Rectangle", builder: (context) => RectangleDemo()));

  return configuration;
}

ExamplesConfiguration getUIExamplesConfiguration() {
  final configuration = ExamplesConfiguration();

  // configuration.add(ExampleItem(
  //     name: "Rectangle", builder: (context) => RectangleDemo()));

  return configuration;
}

class ExamplesConfiguration {
  List<ExampleItem> allExamples = [];

  void add(ExampleItem item) {
    allExamples.add(item);
  }
}

class ExampleItem {
  final String name;
  final WidgetBuilder builder;

  ExampleItem({this.name, this.builder});
}
