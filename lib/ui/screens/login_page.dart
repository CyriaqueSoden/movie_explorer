import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Clé permettant d'accéder au widget Form
    final GlobalKey<FormState> formKey = GlobalKey();
// Controleur permettant d'accéder à la valeur du champs de saisie
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formKey, // Lien avec la clé
        child: Column(
          children: [
            TextFormField(
              controller: usernameController, // Lien avec le controleur
              validator: (value) {
// L'objectif du validator est de vérifier les données saisie
// La fonction doit renvoyée null si le champs est correcte,
// ou le message d'erreur à afficher si la valeur est mauvaise
                if (value == null || value.isEmpty) {
                  return 'Le champs doit être renseigné';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: passwordController, // Lien avec le controleur
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le champs doit être renseigné';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
// Permet de récupérer la valeur du champ via le controleur
                    final String username = usernameController.text;
                    final String password = passwordController.text;
                    context.read<UserCubit>().login(username , password);
                  }
                },
                child: const Text('Se connecter'))
          ],
        ),
      ),
    ));
  }
}
