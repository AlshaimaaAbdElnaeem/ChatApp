import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_states.dart';
import 'package:scholar_chat/pages/cubits/login_cubit/login_cubit/login_cubit.dart';
import 'package:scholar_chat/pages/cubits/login_cubit/login_cubit/login_state.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page.dart';

import 'firebase_options.dart';
import 'pages/cubits/register_cubit/register_cubit.dart';
import 'pages/cubits/register_cubit/register_states.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "chat_app",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context)=>LoginCubit(InitialState())),
      BlocProvider(create: (context)=>RegisterCubit(RegisterInitialState())),
      BlocProvider(create: (context)=>ChatCubit(ChatStates())),
    ] , child: MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id : (context) => ChatPage()
      },
      initialRoute: LoginPage.id,
    ),);
  }
}
