/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 10/10/20
 * Time: 5:08 PM
 * target: 首页骨架屏
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/skeleton_shimmer.dart';
import 'package:flutter_demo/widgets/example_page.dart';

/// 骨架图可以仿照这个来写
/// 继承自SkeletonShimmer，实现skeleton()即可
/// SContainer是对圆角及基准色的封装
/// 只支持一层UI闪烁渲染，不支持多视图层叠及图片
/// 有颜色的widget都会被gradient重写
class SkeletonHomePage extends SkeletonShimmer {

  @override
  Widget skeleton() {
    return SafeArea(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: top(),
        ),
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
        banner(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              index(),
              header(),
            ],
          ),
        ),
        cell1(),
      ],
    ));
  }

  Widget top() {
    return Column(
      children: [
        Container(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SContainer(width: 43, height: 20),
              SContainer(width: 43, height: 20, circularValue: 10),
            ],
          ),
        ),
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SContainer(width: 32, height: 18),
              SContainer(width: 32, height: 18),
              SContainer(width: 32, height: 18),
              SContainer(width: 32, height: 18),
              SContainer(width: 32, height: 18),
              SizedBox(
                width: 39,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget banner() {
    return Container(
      height: 136,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          SContainer(width: 8, height: 120),
          SizedBox(width: 8),
          Expanded(child: SContainer()),
          SizedBox(width: 8),
          SContainer(width: 8, height: 120),
        ],
      ),
    );
  }

  Widget index() {
    return SContainer(
      height: 75,
    );
  }

  Widget header() {
    return Container(
      height: 63,
      margin: EdgeInsets.only(top: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SContainer(height: 24, width: 103),
          SizedBox(height: 10),
          Row(
            children: [
              SContainer(width: 15, height: 17),
              SizedBox(width: 6),
              SContainer(width: 77, height: 17),
              SizedBox(width: 11),
              SContainer(width: 15, height: 17),
              SizedBox(width: 6),
              SContainer(width: 77, height: 17),
              SizedBox(width: 11),
              SContainer(width: 15, height: 17),
              SizedBox(width: 6),
              SContainer(width: 77, height: 17),
            ],
          )
        ],
      ),
    );
  }

  Widget cell1() {
    return Expanded(
        child: Column(
          children: [
            SContainer(
              height: 143,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
            ),
            Expanded(
                child: SContainer(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                ))
          ],
        ));
  }
}

class SkeletonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: "skeleton",
      pathToFile: "animation/skeleton.dart",
      delayStartup: false,
      builder: (context) => SkeletonHomePage(),
    );
  }
}