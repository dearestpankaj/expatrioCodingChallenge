import 'package:coding_challenge/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return _loginForm();
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              backgroundColor: Colors.transparent,
              builder: (context) => _successfulLoginView());
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        } else if (state is LoginLoading) {}
      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/2019_XP_logo_white.png'),
              _titleField(Icons.email_outlined, 'EMAIL ADDRESS'),
              _usernameField(),
              const SizedBox(height: 30),
              _titleField(Icons.lock_outline, 'PASSWORD'),
              _passwordField(),
              _loginButton(),
              const Spacer(),
              _bottomGirlImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: "Username or email address",
            labelText: 'username',
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
            obscureText: _isPasswordHidden,
            controller: _passwordController,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: "Password",
              border: const OutlineInputBorder(),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ));
      },
    );
  }

  Widget _titleField(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: ButtonWidget(
              text: 'LOGIN',
              press: () {
                context.read<LoginBloc>().add(OnLoginRequested(
                    username: _usernameController.text,
                    password: _passwordController.text));
              },
              BackgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }

  Widget _successfulLoginView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.check_sharp,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "Successful Login",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "You will be directed to your dashboard",
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          ButtonWidget(
              text: 'GOT IT',
              press: () {
                Navigator.pushNamed(context, '/home');
              },
              BackgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Widget _bottomGirlImage() {
    return SvgPicture.asset(
      'assets/CryingGirl.svg',
      width: 200.0,
      height: 200.0,
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }
}
