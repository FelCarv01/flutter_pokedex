import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/common/consts/api_consts.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final respponse = await dio.get(ApiConsts.allPokemonsUrl);
      final json = jsonDecode(respponse.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure('Não foi possivel carregar os dados');
    }
  }
}
