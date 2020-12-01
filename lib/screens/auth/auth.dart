import 'package:flutter/material.dart';
import 'package:web_factory/blocs/auth_bloc.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/custom_text_field.dart';
import 'package:web_factory/widgets/responsive/responsive_view.dart';
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
                child: _buildFromColumn(authBloc, context),
              ),
            ),
            mediumScreen: Padding(
              padding: _getMediumPadding(size),
              child: SizedBox(
                width: size.width * 0.5,
                child: _buildFromColumn(authBloc, context),
              ),
            ),
            smallScreen: Padding(
              padding: smallPadding,
              child: _buildFromColumn(authBloc, context),
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

  Column _buildFromColumn(AuthBloc authBloc, BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/SCADA.png', height: 100),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Логин',
                labelText: 'Логин',
                icon: FontAwesomeIcons.user,
                controller: authBloc.loginController,
                validator: (String value) {
                  if (value.isEmpty) return 'Логин не может быть пустым';
                },
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hintText: 'Пароль',
                labelText: 'Пароль',
                icon: FontAwesomeIcons.lock,
                controller: authBloc.passwordController,
                validator: (String value) {
                  if (value.isEmpty) return 'Пароль не был введен';
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        CustomButton(
          color: theme.accentColor,
          child: Text(
            'Войти',
            style: theme.textTheme.button,
          ),
          onPressed: () => print('auth button pressed'),
        ),
      ],
    );
  }
}
