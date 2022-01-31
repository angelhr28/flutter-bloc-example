import 'dart:async';
import 'dart:convert';

import 'package:bloc_example/repository/mapper/pokemon_mapper.dart';
import 'package:http/http.dart' as http;

class PokemonServices {
  Future<PokemonMapper?> getPokemons({required int offset}) async {
    try {
      var queryParameters = {'offset': '$offset', 'limit': '20'};
      var uri = Uri.https('pokeapi.co', '/api/v2/pokemon', queryParameters);
      print(uri);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        PokemonMapper result = PokemonMapper.fromJson(responseJson);
        return result;
      }
    } catch (error) {
      throw Exception('Hubo un error ::: $error');
    }
    return null;
  }
}
