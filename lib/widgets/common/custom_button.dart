import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // gradient: appTheme.mainGradient,
        // boxShadow: appTheme.shadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
