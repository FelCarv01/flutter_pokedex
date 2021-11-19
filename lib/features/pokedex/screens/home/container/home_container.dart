import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/common/widgets/po_error.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        }
        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
