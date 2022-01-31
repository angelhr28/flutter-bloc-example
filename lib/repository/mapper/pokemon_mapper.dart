import 'package:bloc_example/repository/model/pokemon.dart';

class PokemonMapper extends Pokemon {
  PokemonMapper.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results?.add(ResultMapper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    map['results'] =
        results != null ? results?.map((v) => v.toJson()).toList() : [];
    return map;
  }
}

class ResultMapper extends Results {
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    if (url != null) {
      map['id'] = id;
      map['img'] = img;
    }
    return map;
  }

  ResultMapper.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
    id = 0;
    img = '';
    if (url != null) {
      const pkm = 'pokemon/';
      final start = url!.indexOf(pkm) + pkm.length;
      id = int.tryParse(url!.substring(start, url!.length).replaceAll('/', ''));
      img =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    }
  }
}
