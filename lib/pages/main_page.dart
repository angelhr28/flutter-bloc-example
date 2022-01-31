import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon/pokemon_bloc.dart';
import 'home_page.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<PokemonBloc>(create: (_) => PokemonBloc())],
        child: const App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.redAccent),
    );
  }
}
