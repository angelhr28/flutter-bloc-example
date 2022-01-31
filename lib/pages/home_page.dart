import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon/pokemon_bloc.dart';
import '../widgets/list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: const ListCard(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.access_time),
        backgroundColor: Colors.white,
        onPressed: () => pokemonBloc.add(GetListPokemon()),
      ),
    );
  }
}
