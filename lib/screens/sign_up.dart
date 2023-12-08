import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/dto/sign_up_data.dart';
import 'package:flutter_dex/logic/login/login_bloc.dart';
import 'package:flutter_dex/logic/login/login_event.dart';
import 'package:flutter_dex/widgets/elevated_button_padrao.dart';
import 'package:flutter_dex/widgets/flutterdex_logo.dart';

import '../widgets/form_field_padrao.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpData signUpData = SignUpData(email: "", password: "");
  late LoginBloc _loginBloc;

  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Registro"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 30),
            const FlutterdexLogo(),
            Form(
              key: formKey,
              child: Column(children: [
                const SizedBox(height: 50),
                emailFormField(),
                const SizedBox(height: 20),
                passwordFormField(),
                const SizedBox(height: 20),
                submitButton(context),
              ]),
            )
          ]),
        ),
      ),
    );
  }

  Widget emailFormField() {
    return FormFieldPadrao(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um email";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        signUpData.email = inValue ?? "";
      },
      hintText: "email@dominio.com",
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
        signUpData.password = inValue ?? "";
      },
      labelText: "Senha",
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButtonPadrao.getEstiloComTamanho(200, 45),
      child: const Text(
        "Registrar",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          _loginBloc.add(RegisterUser(
              email: signUpData.email, password: signUpData.password));
        }
        Navigator.of(context).pop();
      },
    );
  }
}
