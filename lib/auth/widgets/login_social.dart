import 'package:authentication/auth/auth_cubit/social_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RegisterWithSocial extends StatelessWidget {
  const RegisterWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        return loginUI();
      },
    );
  }

  loginUI() {
    return Consumer<AuthCubit>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return loggedUI(model, context);
      } else {
        return loginControls(context);
      }
    });
  }

  loggedUI(AuthCubit model, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        const SizedBox(height: 20.0),
        Text(model.googleAccount!.displayName ?? ''),
        const SizedBox(height: 10.0),
        Text(model.googleAccount!.email),
        const SizedBox(height: 50.0),
        ActionChip(
            label: const Text('logout'),
            avatar: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthCubit>(context, listen: false).loggOut();
            })
      ],
    );
  }

  loginControls(context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      child: Column(
        children: [
          CustomButton(
            onPress: () {},
            tittle: 'Fackebook Login',
            fontWeight: FontWeight.w500,
            textSize: 18.0,

            backgroundColor: const Color(0xFF4064Ac),
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            onPress: () {
              Provider.of<AuthCubit>(context, listen: false).login();
            },

            backgroundColor: Colors.white,
            tittle: 'Gmail Login',
            fontWeight: FontWeight.w500,
            textSize: 18.0,

            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
