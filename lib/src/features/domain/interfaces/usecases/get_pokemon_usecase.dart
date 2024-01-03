import 'package:pokeflutter/src/features/domain/models/pokemon_model.dart';

abstract class IGetPokemonUsecase {
  Future<PokemonModel> call();
}
