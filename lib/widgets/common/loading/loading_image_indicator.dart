import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

const defaultBorderRadius = BorderRadius.zero;

class LoadingImageIndicator extends StatelessWidget {
  const LoadingImageIndicator({
    Key key,
    this.borderRadius = defaultBorderRadius,
  }) : super(key: key);

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Skeleton(
        style: SkeletonStyle.box,
        animation: SkeletonAnimation.pulse,
        hightlightColor: Color.fromRGBO(189, 189, 189, 1),
        baseColor: Color.fromRGBO(189, 189, 189, 1),
      ),
    );
  }
}
