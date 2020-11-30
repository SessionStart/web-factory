import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_factory/widgets/common/loading/loading_image_indicator.dart';

const defaultBorderRadius = BorderRadius.all(Radius.circular(10.0));

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    Key key,
    @required this.url,
    this.borderRadius = defaultBorderRadius,
    this.height,
    this.width,
  }) : super(key: key);

  final String url;

  final BorderRadius borderRadius;

  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => LoadingImageIndicator(
        borderRadius: borderRadius,
      ),
      errorWidget: (context, url, error) => LoadingImageIndicator(
        borderRadius: borderRadius,
      ),
    );
  }
}
