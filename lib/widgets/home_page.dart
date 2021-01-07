/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 11/4/20
 * Time: 2:12 PM
 * target: 主页模板
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/example_config.dart';

enum ExampleType { code, ui, animation }

class HomePage extends StatelessWidget {
  final String title;
  final Widget greetingWidget;
  final ExampleType exampleType;
  final String filePath;
  HomePage(
      {Key key,
      this.title,
      this.greetingWidget,
      this.exampleType,
      this.filePath})
      : assert(title != null),
        assert(greetingWidget != null),
        assert(exampleType != null),
        assert(filePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              greetingWidget,
              Container(
                height: 20,
              ),
              Text("点击选取demo查看:", style: Theme.of(context).textTheme.bodyText2),
              Container(
                height: 5,
              )
            ]..addAll(generateDemosList(context)),
          ),
        )),
      ),
    );
  }

  void _openExample(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }

  Iterable<Widget> generateDemosList(BuildContext context) {
    ExamplesConfiguration _examplesConfiguration;
    if (exampleType == ExampleType.ui) {
      _examplesConfiguration = getUIExamplesConfiguration();
    } else if (exampleType == ExampleType.animation) {
      _examplesConfiguration = getAnimationExamplesConfiguration();
    } else {
      _examplesConfiguration = getCodeExamplesConfiguration();
    }
    var allExamples = _examplesConfiguration.allExamples;
    return allExamples.map((example) => LinkToExample(
          label: example.name,
          click: () => _openExample(context, example.builder),
        ));
  }
}

class LinkToExample extends StatelessWidget {
  final String label;
  final VoidCallback click;

  const LinkToExample({
    this.label,
    this.click,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.video_library,
            size: 14,
          ),
          Text("   $label"),
        ],
      ),
      onPressed: click,
    );
  }
}

class GreetingText extends StatelessWidget {
  final String category;
  GreetingText({this.category});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(style: Theme.of(context).textTheme.bodyText2, children: [
        TextSpan(
            text:
                "这里是练习"),
        TextSpan(
            text: category,
            style: Theme.of(context).textTheme.bodyText1),
        TextSpan(
            text: "的地方。记录一些常用的$category "
                "你可以随意取用、修改，希望能给你带来一些帮助，"
                "也欢迎进行提交！")
      ]),
    );
  }
}
