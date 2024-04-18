import 'package:films/src/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc/home_screen_bloc.dart';
import 'bloc/save_bloc/save_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenBloc>(
          create: (BuildContext context) => HomeScreenBloc(),
        ),
        BlocProvider<SaveBloc>(
          create: (BuildContext context) => SaveBloc(),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
