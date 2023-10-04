import 'package:flutter/material.dart';
import 'package:flutter_dex/dto/sign_up_data.dart';
import 'package:flutter_dex/widgets/elevated_button_padrao.dart';

import '../widgets/form_field_padrao.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpData signUpData = SignUpData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              FormFieldPadrao(
                keyboardType: TextInputType.emailAddress,
                labelText: "E-mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira um e-mail válido";
                  }
                  return null;
                },
                onSaved: (value) {
                  signUpData.email = value ?? "";
                },
              ),
              const SizedBox(height: 16.0),
              FormFieldPadrao(
                obscureText: true,
                labelText: "Senha",
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "A senha deve conter no mínimo 6 caracteres";
                  }
                  return null;
                },
                onSaved: (value) {
                  signUpData.password = value ?? "";
                },
              ),
              const SizedBox(height: 16.0),
              const Text("Gênero"),
              Row(
                children: [
                  Radio(
                    value: "Masculino",
                    groupValue: signUpData.gender,
                    onChanged: (value) {
                      setState(() {
                        signUpData.gender = value.toString();
                      });
                    },
                  ),
                  const Text("Masculino"),
                  Radio(
                    value: "Feminino",
                    groupValue: signUpData.gender,
                    onChanged: (value) {
                      setState(() {
                        signUpData.gender = value.toString();
                      });
                    },
                  ),
                  const Text("Feminino"),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text("Data de Nascimento:"),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButtonPadrao.getEstilo(),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now(),
                    helpText: "Selecione sua data de nascimento",
                  );
                  if (selectedDate != null) {
                    setState(() {
                      signUpData.birthDate = selectedDate;
                    });
                  }
                },
                child: Text(
                  signUpData.birthDate != null
                      ? signUpData.birthDate!.toLocal().toString().split(' ')[0]
                      : "Selecionar Data",
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButtonPadrao.getEstilo(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // Agora você pode enviar signUpData para o seu servidor ou
                    // executar outras ações necessárias com os dados do usuário.
                  }
                },
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
