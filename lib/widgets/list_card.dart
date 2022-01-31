import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon/pokemon_bloc.dart';
import 'card_generic.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        final result = state.result ?? [];
        if (result.isEmpty) {
          return const Center(
            child: Text('Presiona el boton para buscar los pokemones...'),
          );
        }
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CardGeneric(
                name: result[index].name ?? '',
                img: result[index].img ?? '',
                onPressed: () {},
              ),
            );
          },
        );
      },
    );
  }
}
