import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/widgets/pokemon_type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: pokemon.type
                            .map((e) => PokemonTypeWidget(
                                  name: e,
                                ))
                            .toList(),
                      ),
                      Flexible(
                          child: Container(
                        height: 100,
                        width: 100,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 2,
            child: Image.network(
              pokemon.image,
            ),
          ),
        ],
      ),
    );
  }
}
