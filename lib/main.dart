import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/home/manager/page_manager.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_const.dart';
import 'features/presentation/cubit/chat/chat_cubit.dart';
import 'features/presentation/cubit/user/user_cubit.dart';
import 'features/presentation/pages/login_page.dart';
import 'firebase_options.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
            color: kWineRedColor,
          ),
        ),
        home: LoginPage());
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return const MyPageManager();
    }
    return const LoginScreen();
  }
}
*/

import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation/cubit/auth/auth_cubit.dart';
import 'features/presentation/cubit/credential/credential_cubit.dart';
import 'features/presentation/cubit/group/group_cubit.dart';
import 'features/presentation/pages/home_page.dart';
import 'on_generate_route.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>()..getUsers(),
        ),
        BlocProvider<GroupCubit>(
          create: (_) => di.sl<GroupCubit>()..getGroups(),
        ),
        BlocProvider<ChatCubit>(
          create: (_) => di.sl<ChatCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(uid: authState.uid);
                } else
                  return LoginPage();
              },
            );
          }
        },
      ),
    );
  }
}
