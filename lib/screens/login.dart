import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/logic/login/login_bloc.dart';
import 'package:flutter_dex/logic/login/login_event.dart';
import 'package:flutter_dex/screens/sign_up.dart';
import 'package:flutter_dex/widgets/elevated_button_padrao.dart';
import 'package:flutter_dex/widgets/flutterdex_logo.dart';

import '../model/login_data.dart';
import '../widgets/form_field_padrao.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(username: "", password: "");

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 30),
        const FlutterdexLogo(),
        Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              usernameFormField(),
              const SizedBox(height: 20),
              passwordFormField(),
              const Divider(),
              submitButton(context),
              const SizedBox(height: 5),
              signUpButton(context),
            ],
          ),
        )
      ]),
    ));
  }

  Widget usernameFormField() {
    return FormFieldPadrao(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um nome de usuário";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.username = inValue ?? "";
      },
      hintText: "Email@Dominio.com",
      labelText: "E-mail",
    );
  }

  Widget passwordFormField() {
    return FormFieldPadrao(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 6) {
            return "Mínimo de 6 dígitos";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.password = inValue ?? "";
      },
      labelText: "Senha",
    );
  }

  Widget signUpButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButtonPadrao.getEstiloComTamanho(150, 38),
      onPressed: () {
        // Navegue para a página de registro quando o botão de registro for pressionado
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpForm(), // Chama a página de registro
          ),
        );
      },
      child: const Text("Registrar", style: TextStyle(fontSize: 14)),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButtonPadrao.getEstiloComTamanho(200, 45),
      child: const Text(
        "Entrar",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          BlocProvider.of<LoginBloc>(context).add(LoginUser(
              username: loginData.username, password: loginData.password));
          // loginBloc.add
        }
      },
    );
  }
}
