import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/widgets/details_appbar_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon,
            onBack: () {},
          )
        ],
      ),
    );
  }
}
