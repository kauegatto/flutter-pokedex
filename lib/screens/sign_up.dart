import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
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

  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
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
                submitButton(context),
              ]),
            )
          ]),
>>>>>>> 19fa8a2 (Firebase)
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======

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
        "Entrar",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          BlocProvider.of<LoginBloc>(context).add(RegisterUser(
              email: signUpData.email, password: signUpData.password));
        }
      },
    );
  }
}


// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final SignUpData signUpData = SignUpData(email: "", password: "");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cadastro"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               FormFieldPadrao(
//                 keyboardType: TextInputType.emailAddress,
//                 labelText: "E-mail",
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Insira um e-mail válido";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   signUpData.email = value ?? "";
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               FormFieldPadrao(
//                 obscureText: true,
//                 labelText: "Senha",
//                 validator: (value) {
//                   if (value == null || value.length < 6) {
//                     return "A senha deve conter no mínimo 6 caracteres";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   signUpData.password = value ?? "";
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               const Text("Gênero"),
//               Row(
//                 children: [
//                   Radio(
//                     value: "Masculino",
//                     groupValue: signUpData.gender,
//                     onChanged: (value) {
//                       setState(() {
//                         signUpData.gender = value.toString();
//                       });
//                     },
//                   ),
//                   const Text("Masculino"),
//                   Radio(
//                     value: "Feminino",
//                     groupValue: signUpData.gender,
//                     onChanged: (value) {
//                       setState(() {
//                         signUpData.gender = value.toString();
//                       });
//                     },
//                   ),
//                   const Text("Feminino"),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               const Text("Data de Nascimento:"),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 style: ElevatedButtonPadrao.getEstilo(),
//                 onPressed: () async {
//                   final selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1980),
//                     lastDate: DateTime.now(),
//                     helpText: "Selecione sua data de nascimento",
//                   );
//                   if (selectedDate != null) {
//                     setState(() {
//                       signUpData.birthDate = selectedDate;
//                     });
//                   }
//                 },
//                 child: Text(
//                   signUpData.birthDate != null
//                       ? signUpData.birthDate!.toLocal().toString().split(' ')[0]
//                       : "Selecionar Data",
//                 ),
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 style: ElevatedButtonPadrao.getEstilo(),
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();

//                     BlocProvider.of<LoginBloc>(context)
//                       .add(RegisterUser(email: signUpData.email, password: signUpData.password));
//                     // Agora você pode enviar signUpData para o seu servidor ou
//                     // executar outras ações necessárias com os dados do usuário.
//                   }
//                 },
//                 child: const Text("Cadastrar"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
>>>>>>> 19fa8a2 (Firebase)
