/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 11/3/20
 * Time: 6:13 PM
 * target: 验证性代码片段主页
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/home_page.dart';

class CodePieces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CodePieces build');
    return HomePage(
      title: 'Simple Code Example',
      greetingWidget: GreetingText(category: 'Code'),
      exampleType: ExampleType.code,
      filePath: 'code',
    );
  }
}