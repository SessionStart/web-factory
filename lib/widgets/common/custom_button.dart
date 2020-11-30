import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/theme/app_theme.dart';
import 'package:flutter_firebase_site/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.color = Colors.transparent,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: AppTheme.mainGradient,
          boxShadow: AppTheme.boxShadow,
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
