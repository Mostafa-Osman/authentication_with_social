import 'package:authentication/auth/Screens/register_screen.dart';
import 'package:authentication/shared/components/customButton/button_cubit/button_cubit_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_cubit/social_cubit.dart';
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
        BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(
          create: (context) => SocialCubit(),
          child: const RegisterScreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RegisterScreen(),
      ),
    );
  }
}
