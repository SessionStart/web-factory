import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';

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
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: color),
        ),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: child,
      ),
    );
  }
}
