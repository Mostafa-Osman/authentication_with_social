import 'package:authentication/auth/login/Screens/login_screen.dart';
import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/auth/register/register_with_email/register_cubit/register_cubit.dart';
import 'package:authentication/auth/register/register_with_email/screens/register_screen.dart';
import 'package:authentication/auth/register/register_with_phone/cubit/register_with_phone_cubit.dart';
import 'package:authentication/auth/reset_password/create_password.dart';
import 'package:authentication/auth/reset_password/cubit/create_password_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (_) => RegisterCubit(RegisterRepository()),
        //     child: const OTPScreen()),
        // BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(
          create: (context) => RegisterWithEmailCubit(),
          child: const RegisterScreen(),
        ),
        BlocProvider(
          create: (context) => CreatePasswordCubit(),
          child: const CreatePasswordScreen(),
        ),
        BlocProvider(
          create: (context) => RegisterWithPhoneCubit(),
          child: const RegisterScreen(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
