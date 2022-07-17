import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/profile/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 150.0),
            CircleAvatar(
              backgroundImage:
                  Image.network(cubit.googleAccount!.photoUrl ?? '').image,
              radius: 50,
            ),
            const SizedBox(height: 70.0),
            DisplayInfo(
              text: cubit.googleAccount!.displayName ?? '',
              icon: Icons.person,
            ),
            DisplayInfo(
              text: cubit.googleAccount!.email,
              icon: Icons.email,
            ),
            const SizedBox(height: 50.0),
            InkWell(
              onTap: ()=>cubit.loggOut(),
              child: Container(
                height: 50.0,
                width: 100.0,
                padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                  color: Colors.grey[400],
                child: Row(
                  children: const[
                   Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                     SizedBox(width: 5.0),
                     Text(
                    'logout',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                     ),
],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
