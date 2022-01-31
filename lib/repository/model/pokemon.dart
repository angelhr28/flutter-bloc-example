import '../mapper/pokemon_mapper.dart';

class Pokemon {
  int? count;
  String? next;
  String? previous;
  List<ResultMapper>? results;
}

class Results {
  int? id;
  String? name;
  String? url;
  String? img;
}
