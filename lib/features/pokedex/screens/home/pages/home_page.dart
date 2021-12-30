import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: list
              .map(
                (e) => PokemonItemWidget(
                  pokemon: e,
                  onTap: onItemTap,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
