import 'package:flutter/material.dart';
import 'package:pokeflutter/src/features/domain/interfaces/usecases/get_pokemons_usecase.dart';
import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';
import 'package:pokeflutter/src/features/presentation/controllers/home_states.dart';

class HomeStore extends ValueNotifier<HomeStates> {
  final IGetHomeUsecase getHomeUsecase;

  PokemonsModel? pokemonsModel;
  HomeStore({required this.getHomeUsecase}) : super(InitialHomeStates());

  Future<void> getPokemonHome() async {
    // value = LoadingHomeStates();

    pokemonsModel = await getHomeUsecase();

    // value = LoadedHomeStates();
  }
}
