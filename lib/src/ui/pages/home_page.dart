import 'package:flutter/material.dart';

import '../../data/services/pokemon_service.dart';
import '../../domain/model/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final service = PokemonService();

  var isLoading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
