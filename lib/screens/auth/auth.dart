import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/blocs/auth_bloc.dart';
import 'package:flutter_firebase_site/widgets/common/custom_button.dart';
import 'package:flutter_firebase_site/widgets/common/custom_text_field.dart';
import 'package:flutter_firebase_site/widgets/responsive/responsive_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

const smallPadding = EdgeInsets.all(35);

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final authBloc = Provider.of<AuthBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: ResponsiveView(
            largeScreen: Padding(
              padding: _getLargePadding(size),
              child: SizedBox(
                width: size.width * 0.4,
                child: _buildFromColumn(authBloc),
              ),
            ),
            mediumScreen: Padding(
              padding: _getMediumPadding(size),
              child: SizedBox(
                width: size.width * 0.5,
                child: _buildFromColumn(authBloc),
              ),
            ),
            smallScreen: Padding(
              padding: smallPadding,
              child: _buildFromColumn(authBloc),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _getLargePadding(Size size) {
    return smallPadding.copyWith(
      left: size.width * 0.3,
      right: size.width * 0.3,
    );
  }

  EdgeInsets _getMediumPadding(Size size) {
    return smallPadding.copyWith(
      left: size.width * 0.25,
      right: size.width * 0.25,
    );
  }

  Column _buildFromColumn(AuthBloc authBloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset('assets/img/FlutterWeb.png', height: 100),
        Padding(
          padding: const EdgeInsets.all(5.0).copyWith(right: 30.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Login',
                labelText: 'Login',
                icon: FontAwesomeIcons.user,
                controller: authBloc.loginController,
                validator: (value) {
                  if (value.isEmpty) return 'Empty login';
                },
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hintText: 'Password',
                labelText: 'Password',
                icon: FontAwesomeIcons.lock,
                controller: authBloc.passwordController,
                validator: (value) {
                  if (value.isEmpty) return 'Empty password';
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        CustomButton(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => print('auth button pressed')),
      ],
    );
  }
}
