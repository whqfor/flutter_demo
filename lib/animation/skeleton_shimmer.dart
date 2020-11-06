/*
 * Created with Android Studio.
 * User: tal
 * Date: 10/10/20
 * Time: 5:11 PM
 * target: 闪烁骨架基类
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract class SkeletonShimmer extends StatelessWidget {
  @factory
  Widget skeleton();

  @override
  Widget build(BuildContext context) {
    return DShimmer.fromColors(
      baseColor: Color(0xFFE7E8EA),
      highlightColor: Colors.grey[100],
      period: Duration(milliseconds: 1500),
      child: skeleton(),
    );
  }
}

class DShimmer extends Shimmer {
  final Widget child;
  final Duration period;
  final ShimmerDirection direction;
  final Gradient gradient;
  final int loop;
  final bool enabled;

  DShimmer.fromColors({
    Key key,
    @required this.child,
    @required Color baseColor,
    @required Color highlightColor,
    this.period = const Duration(milliseconds: 2000),
    this.direction = ShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  })  : gradient = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[
              baseColor,
              baseColor,
              highlightColor,
              baseColor,
              baseColor
            ],
            stops: const <double>[
              0.0,
              0.35,
              0.5,
              0.65,
              1.0
            ]),
        super(key: key);
}

class SContainer extends Container {
  final Key key;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Decoration decoration;
  final Decoration foregroundDecoration;
  final double width;
  final double height;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final Matrix4 transform;
  final Widget child;
  final Clip clipBehavior;
  final double circularValue;

  SContainer({
    this.key,
    this.alignment,
    this.padding,
    this.color = const Color(0xFFE7E8EA),
    Decoration decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.child,
    this.clipBehavior = Clip.none,
    this.circularValue = 2,
  }) : decoration = decoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(circularValue),
                color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: decoration != null ? null : color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: child,
      clipBehavior: clipBehavior,
    );
  }
}
